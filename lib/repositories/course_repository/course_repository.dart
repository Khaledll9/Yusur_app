import '../../models/course_model.dart';
import '../../network/exceptions.dart';
import '../../services/course_service/course_service.dart';
import 'course_repository_impl.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseService _courseService;
  final List<Course> _cachedCourses = [];

  CourseRepositoryImpl({required CourseService courseService})
    : _courseService = courseService;

  // ========== CACHE OPERATIONS ==========

  @override
  Future<void> cacheCourses(List<Course> courses) async {
    // Remove old courses not in new list
    final newCourseIds = courses.map((c) => c.id).toSet();
    _cachedCourses.removeWhere((course) => !newCourseIds.contains(course.id));

    // Update or add courses
    for (final course in courses) {
      final index = _cachedCourses.indexWhere((c) => c.id == course.id);
      if (index != -1) {
        _cachedCourses[index] = course;
      } else {
        _cachedCourses.add(course);
      }
    }
  }

  // ========== CRUD OPERATIONS ==========

  @override
  Future<Course> createCourse(Course course) async {
    final createdCourse = await _courseService.createCourse(course);
    _cachedCourses.add(createdCourse);
    return createdCourse;
  }

  @override
  Future<void> deleteCourse(String id) async {
    await _courseService.deleteCourse(id);
    _cachedCourses.removeWhere((course) => course.id == id);
  }

  // ========== FILTER OPERATIONS ==========

  @override
  Future<List<Course>> filterCourses({
    String? departmentId,
    bool? isActive,
    bool? isOpen,
    String? searchQuery,
  }) async {
    List<Course> filtered = _cachedCourses;

    // Apply department filter
    if (departmentId != null) {
      filtered = filtered.where((course) {
        return course.departmentId == departmentId;
      }).toList();
    }

    // Apply active status filter
    if (isActive != null) {
      filtered = filtered.where((course) {
        final isCourseActive =
            course.isActive == '1' || course.isActive == 'true';
        return isCourseActive == isActive;
      }).toList();
    }

    // Apply open status filter
    if (isOpen != null) {
      filtered = filtered.where((course) {
        final isCourseOpen = course.isOpen == '1' || course.isOpen == 'true';
        return isCourseOpen == isOpen;
      }).toList();
    }

    // Apply search filter
    if (searchQuery != null && searchQuery.isNotEmpty) {
      filtered = filtered.where((course) {
        final titleAr = course.titleAr.toLowerCase();
        final titleEn = course.titleEn?.toLowerCase() ?? '';
        final nameAr = course.nameAr.toLowerCase();
        final nameEn = course.nameEn?.toLowerCase() ?? '';
        final code = course.code.toLowerCase();
        final query = searchQuery.toLowerCase();

        return titleAr.contains(query) ||
            titleEn.contains(query) ||
            nameAr.contains(query) ||
            nameEn.contains(query) ||
            code.contains(query);
      }).toList();
    }

    return filtered;
  }

  @override
  Future<List<Course>> getActiveCourses() async {
    try {
      final courses = await _courseService.getActiveCourses();
      await cacheCourses(courses);
      return courses;
    } catch (e) {
      // Fallback to cache filter
      return _cachedCourses.where((course) {
        return course.isActive == '1' || course.isActive == 'true';
      }).toList();
    }
  }

  // ========== GET OPERATIONS ==========

  @override
  Future<List<Course>> getAllCourses() async {
    try {
      final courses = await _courseService.getAllCourses();
      await cacheCourses(courses);
      return courses;
    } catch (e) {
      // Fallback to cache if network fails
      if (_cachedCourses.isNotEmpty) {
        return _cachedCourses;
      }
      rethrow;
    }
  }

  @override
  Future<List<Course>> getCachedCourses() async {
    return List.from(_cachedCourses);
  }

  @override
  Future<List<Course>> getCachedCoursesByDepartment(String departmentId) async {
    return _cachedCourses.where((course) {
      return course.departmentId == departmentId;
    }).toList();
  }

  @override
  Future<Course> getCourseById(String id) async {
    try {
      return await _courseService.getCourseById(id);
    } catch (e) {
      // Try to find in cache
      final cachedCourse = _cachedCourses.firstWhere(
        (course) => course.id == id,
        orElse: () => throw NotFoundException('Course not found'),
      );
      return cachedCourse;
    }
  }

  @override
  Future<List<Course>> getCoursesByDepartment(String departmentId) async {
    try {
      final courses = await _courseService.getCoursesByDepartment(departmentId);

      // Update cache with these courses
      for (final course in courses) {
        final index = _cachedCourses.indexWhere((c) => c.id == course.id);
        if (index != -1) {
          _cachedCourses[index] = course;
        } else {
          _cachedCourses.add(course);
        }
      }

      return courses;
    } catch (e) {
      // Fallback to local filter
      return getCachedCoursesByDepartment(departmentId);
    }
  }

  @override
  Future<List<Course>> searchCourses(String query) async {
    if (query.isEmpty) return getAllCourses();

    try {
      final courses = await _courseService.searchCourses(query);

      // Update cache with search results
      for (final course in courses) {
        final index = _cachedCourses.indexWhere((c) => c.id == course.id);
        if (index != -1) {
          _cachedCourses[index] = course;
        } else {
          _cachedCourses.add(course);
        }
      }

      return courses;
    } catch (e) {
      // Fallback to local search
      return _cachedCourses.where((course) {
        final titleAr = course.titleAr.toLowerCase();
        final titleEn = course.titleEn?.toLowerCase() ?? '';
        final nameAr = course.nameAr.toLowerCase();
        final nameEn = course.nameEn?.toLowerCase() ?? '';
        final code = course.code.toLowerCase();
        final searchQuery = query.toLowerCase();

        return titleAr.contains(searchQuery) ||
            titleEn.contains(searchQuery) ||
            nameAr.contains(searchQuery) ||
            nameEn.contains(searchQuery) ||
            code.contains(searchQuery);
      }).toList();
    }
  }

  @override
  Future<Course> updateCourse(String id, Course course) async {
    final updatedCourse = await _courseService.updateCourse(id, course);

    final index = _cachedCourses.indexWhere((c) => c.id == id);
    if (index != -1) {
      _cachedCourses[index] = updatedCourse;
    } else {
      _cachedCourses.add(updatedCourse);
    }

    return updatedCourse;
  }

  @override
  Future<void> updateCourseStatus(String id, bool isActive) async {
    await _courseService.updateCourseStatus(id, isActive);

    final index = _cachedCourses.indexWhere((c) => c.id == id);
    if (index != -1) {
      _cachedCourses[index] = _cachedCourses[index].copyWith(
        isActive: isActive ? '1' : '0',
      );
    }
  }
}
