import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/course_model.dart';
import '../../repositories/course_repository/course_repository_impl.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository _repository;
  List<Course> _allCourses = [];

  CourseCubit({required CourseRepository repository})
    : _repository = repository,
      super(CourseState.initial()) {
    _loadFromCache();
  }

  void applyFilters({String? departmentId, bool? isActive, bool? isOpen}) {
    emit(
      state.copyWith(
        departmentId: departmentId,
        isActive: isActive,
        isOpen: isOpen,
        courses: _applyFilters(_allCourses),
      ),
    );
  }

  void clearError() {
    if (state.hasError) {
      emit(state.copyWith(error: null));
    }
  }

  void clearSearch() {
    emit(state.copyWith(courses: _allCourses, searchQuery: ''));
  }

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

  // ========== PUBLIC METHODS ==========

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
