// lib/features/course/presentation/cubit/course_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/course_model.dart';
import '../../repositories/course_repository/course_repository.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository _repository;
  List<Course> _allCourses = [];

  CourseCubit({required CourseRepository repository})
    : _repository = repository,
      super(CourseState.initial()) {
    _loadFromCache();
  }

  // Helper getters
  List<Course> get activeCourses => state.courses.where((c) {
    return c.isActive == '1' || c.isActive == 'true';
  }).toList();

  bool get hasActiveCourses => activeCourses.isNotEmpty;

  bool get hasOpenCourses => openCourses.isNotEmpty;

  List<Course> get openCourses => state.courses.where((c) {
    return c.isOpen == '1' || c.isOpen == 'true';
  }).toList();

  // Filter operations
  void applyFilters({String? departmentId, bool? isActive, bool? isOpen}) {
    // If we have multiple filters, load from API
    if ((departmentId != null && (isActive != null || isOpen != null)) ||
        (isActive != null && isOpen != null)) {
      loadCoursesWithFilters(
        departmentId: departmentId,
        isActive: isActive,
        isOpen: isOpen,
      );
    } else {
      // Otherwise use local filtering
      emit(
        state.copyWith(
          departmentId: departmentId,
          isActive: isActive,
          isOpen: isOpen,
          courses: _applyFilters(_allCourses),
        ),
      );
    }
  }

  void clearError() {
    if (state.hasError) {
      emit(state.copyWith(error: null));
    }
  }

  void clearFilters() {
    emit(
      state.copyWith(
        departmentId: null,
        isActive: null,
        isOpen: null,
        courses: _allCourses,
      ),
    );
  }

  void clearSearch() {
    emit(state.copyWith(courses: _allCourses, searchQuery: ''));
  }

  void clearSelection() {
    emit(state.copyWith(selectedCourse: null));
  }

  // CRUD operations
  Future<void> createCourse(Course course) async {
    try {
      emit(state.copyWith(isCreating: true, error: null));

      final createdCourse = await _repository.createCourse(course);
      _allCourses.insert(0, createdCourse);

      emit(
        state.copyWith(courses: _applyFilters(_allCourses), isCreating: false),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isCreating: false));
      rethrow;
    }
  }

  Future<void> deleteCourse(String id) async {
    try {
      emit(state.copyWith(isDeleting: true, error: null));

      await _repository.deleteCourse(id);
      _allCourses.removeWhere((course) => course.id == id);

      emit(
        state.copyWith(courses: _applyFilters(_allCourses), isDeleting: false),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isDeleting: false));
      rethrow;
    }
  }

  Future<void> getCourseByCode(String code) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final course = await _repository.getCourseByCode(code);

      if (course == null) {
        throw Exception('Course not found with code: $code');
      }

      emit(state.copyWith(selectedCourse: course, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> loadActiveCourses() async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final courses = await _repository.getActiveCourses();
      _allCourses = courses;

      emit(state.copyWith(courses: courses, isLoading: false, isActive: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  // ========== PUBLIC METHODS ==========

  // Load operations
  Future<void> loadAllCourses() async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final courses = await _repository.getAllCourses();
      _allCourses = courses;

      emit(state.copyWith(courses: courses, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> loadCourse(String id) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final course = await _repository.getCourseById(id);

      emit(state.copyWith(selectedCourse: course, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> loadCoursesWithFilters({
    String? departmentId,
    bool? isActive,
    bool? isOpen,
  }) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final courses = await _repository.getCoursesByMultipleFilters(
        departmentId: departmentId,
        isActive: isActive,
        isOpen: isOpen,
      );

      _allCourses = courses;

      emit(
        state.copyWith(
          courses: courses,
          isLoading: false,
          departmentId: departmentId,
          isActive: isActive,
          isOpen: isOpen,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> loadDepartmentCourses(String departmentId) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final courses = await _repository.getCoursesByDepartment(departmentId);

      emit(
        state.copyWith(
          courses: courses,
          isLoading: false,
          departmentId: departmentId,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> loadOpenCourses() async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final courses = await _repository.getOpenCourses();
      _allCourses = courses;

      emit(state.copyWith(courses: courses, isLoading: false, isOpen: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  // Utility methods
  void refresh() async {
    await loadAllCourses();
  }

  void reset() {
    _allCourses.clear();
    emit(CourseState.initial());
  }

  // Search operations
  Future<void> searchCourses(String query) async {
    if (query.isEmpty) {
      emit(state.copyWith(courses: _allCourses, searchQuery: ''));
      return;
    }

    try {
      emit(state.copyWith(isLoading: true, searchQuery: query));

      final courses = await _repository.searchCourses(query);

      emit(
        state.copyWith(courses: courses, isLoading: false, searchQuery: query),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> toggleCourseOpenStatus(String id, bool isOpen) async {
    try {
      final index = _allCourses.indexWhere((c) => c.id == id);
      if (index == -1) return;

      // Optimistic update
      _allCourses[index] = _allCourses[index].copyWith(
        isOpen: isOpen ? '1' : '0',
      );
      emit(state.copyWith(courses: _applyFilters(_allCourses)));

      // API call
      await _repository.toggleCourseOpenStatus(id, isOpen);

      emit(state.copyWith(courses: _applyFilters(_allCourses)));
    } catch (e) {
      // Revert on error
      final index = _allCourses.indexWhere((c) => c.id == id);
      if (index != -1) {
        _allCourses[index] = _allCourses[index].copyWith(
          isOpen: !isOpen ? '1' : '0',
        );
      }
      emit(
        state.copyWith(
          error: e.toString(),
          courses: _applyFilters(_allCourses),
        ),
      );
      rethrow;
    }
  }

  Future<void> updateCourse(String id, Course course) async {
    try {
      emit(state.copyWith(isUpdating: true, error: null));

      final updatedCourse = await _repository.updateCourse(id, course);

      final index = _allCourses.indexWhere((c) => c.id == id);
      if (index != -1) {
        _allCourses[index] = updatedCourse;
      }

      emit(
        state.copyWith(
          courses: _applyFilters(_allCourses),
          selectedCourse: updatedCourse,
          isUpdating: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isUpdating: false));
      rethrow;
    }
  }

  // Status operations
  Future<void> updateCourseStatus(String id, bool isActive) async {
    try {
      await _repository.updateCourseStatus(id, isActive);

      final index = _allCourses.indexWhere((c) => c.id == id);
      if (index != -1) {
        _allCourses[index] = _allCourses[index].copyWith(
          isActive: isActive ? '1' : '0',
        );
      }

      emit(state.copyWith(courses: _applyFilters(_allCourses)));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
      rethrow;
    }
  }

  List<Course> _applyFilters(List<Course> courses) {
    List<Course> filtered = courses;

    // Apply department filter
    if (state.departmentId != null) {
      filtered = filtered.where((course) {
        return course.departmentId == state.departmentId;
      }).toList();
    }

    // Apply active status filter
    if (state.isActive != null) {
      filtered = filtered.where((course) {
        final isCourseActive =
            course.isActive == '1' || course.isActive == 'true';
        return isCourseActive == state.isActive;
      }).toList();
    }

    // Apply open status filter
    if (state.isOpen != null) {
      filtered = filtered.where((course) {
        final isCourseOpen = course.isOpen == '1' || course.isOpen == 'true';
        return isCourseOpen == state.isOpen;
      }).toList();
    }

    // Apply search filter
    if (state.searchQuery.isNotEmpty) {
      filtered = filtered.where((course) {
        final titleAr = course.titleAr.toLowerCase();
        final titleEn = course.titleEn?.toLowerCase() ?? '';
        final nameAr = course.nameAr.toLowerCase();
        final nameEn = course.nameEn?.toLowerCase() ?? '';
        final code = course.code.toLowerCase();
        final query = state.searchQuery.toLowerCase();

        return titleAr.contains(query) ||
            titleEn.contains(query) ||
            nameAr.contains(query) ||
            nameEn.contains(query) ||
            code.contains(query);
      }).toList();
    }

    return filtered;
  }

  // ========== PRIVATE METHODS ==========

  Future<void> _loadFromCache() async {
    try {
      final cached = await _repository.getCachedCourses();
      if (cached.isNotEmpty) {
        _allCourses = cached;

        emit(state.copyWith(courses: cached));
      }
    } catch (e) {
      // Silent fail
    }
  }
}
