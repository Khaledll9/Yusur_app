import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../models/course_model.dart';
import '../../repositories/course_repository/course_repository.dart';
import '../../repositories/course_repository/course_repository_impl.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository _repository;

  CourseCubit({required CourseRepository repository})
    : _repository = repository,
      super(const CourseInitial());

  int get activeCourseCount {
    final currentState = state;
    return currentState is CourseListLoaded
        ? currentState.activeCourses.length
        : 0;
  }

  int get courseCount {
    final currentState = state;
    return currentState is CourseListLoaded ? currentState.courses.length : 0;
  }

  bool get hasFilter {
    final currentState = state;
    return currentState is CourseListLoaded && currentState.hasFilter;
  }

  // Utility getters
  bool get isSearching {
    final currentState = state;
    return currentState is CourseListLoaded && currentState.isSearching;
  }

  int get openCourseCount {
    final currentState = state;
    return currentState is CourseListLoaded
        ? currentState.openCourses.length
        : 0;
  }

  void clearDepartmentFilter() {
    final currentState = state;

    if (currentState is CourseListLoaded && currentState.hasFilter) {
      loadCourses();
    }
  }

  void clearSearch() {
    final currentState = state;

    if (currentState is CourseListLoaded) {
      if (currentState.hasSearchQuery || currentState.hasFilter) {
        loadCourses();
      }
    }
  }

  Future<void> createCourse(CreateCourseRequest request) async {
    final currentState = state;

    emit(
      const CourseOperationLoading(operationType: CourseOperationType.create),
    );

    final result = await _repository.createCourse(request);

    result.fold(
      (error) {
        emit(CourseError(message: error));
      },
      (course) {
        emit(
          CourseOperationSuccess(
            message: 'Course created successfully',
            course: course,
            previousState: currentState,
          ),
        );

        // After success, refresh the list
        _refreshAfterOperation(currentState);
      },
    );
  }

  // DELETE: Delete course
  Future<void> deleteCourse(int id) async {
    final currentState = state;

    emit(
      const CourseOperationLoading(operationType: CourseOperationType.delete),
    );

    final result = await _repository.deleteCourse(id);

    result.fold(
      (error) {
        emit(CourseError(message: error));
      },
      (_) {
        emit(
          CourseOperationSuccess(
            message: 'Course deleted successfully',
            previousState: currentState,
          ),
        );

        // After success, refresh the list
        _refreshAfterOperation(currentState);
      },
    );
  }

  // Get course by ID from current state
  Course? getCourseByIdFromState(int courseId) {
    final currentState = state;

    if (currentState is CourseListLoaded) {
      try {
        return currentState.courses.firstWhere(
          (course) => course.id == courseId,
        );
      } catch (e) {
        return null;
      }
    } else if (currentState is CourseDetailLoaded) {
      return currentState.course.id == courseId ? currentState.course : null;
    }

    return null;
  }

  // GET: Load course by ID
  Future<void> loadCourseById(int id) async {
    try {
      emit(const CourseLoading());

      final result = await _repository.getCourseById(id);

      result.fold(
        (error) => emit(CourseError(message: error)),
        (course) => emit(CourseDetailLoaded(course: course)),
      );
    } catch (e) {
      emit(const CourseError(message: 'Failed to load course details'));
    }
  }

  // GET: Load all courses
  Future<void> loadCourses() async {
    try {
      emit(const CourseLoading());

      final result = await _repository.getCourses();

      result.fold((error) => emit(CourseError(message: error)), (courses) {
        emit(CourseListLoaded(courses: courses));
      });
    } catch (e) {
      emit(const CourseError(message: 'Failed to load courses'));
    }
  }

  // GET: Load courses by department
  Future<void> loadCoursesByDepartment(int departmentId) async {
    try {
      emit(const CourseLoading());

      final result = await _repository.getCoursesByDepartment(departmentId);

      result.fold((error) => emit(CourseError(message: error)), (courses) {
        emit(
          CourseListLoaded(
            courses: courses,
            filterDepartment: departmentId.toString(),
          ),
        );
      });
    } catch (e) {
      emit(const CourseError(message: 'Failed to load department courses'));
    }
  }

  // GET: Refresh courses
  Future<void> refreshCourses() async {
    final currentState = state;

    emit(const CourseLoading());

    final result = await _repository.getCourses();

    result.fold(
      (error) {
        emit(CourseError(message: error));
      },
      (courses) {
        if (currentState is CourseListLoaded) {
          emit(currentState.copyWith(courses: courses));
        } else {
          emit(CourseListLoaded(courses: courses));
        }
      },
    );
  }

  // GET: Search courses
  Future<void> searchCourses(String query) async {
    if (query.isEmpty) {
      loadCourses();
      return;
    }

    final currentState = state;

    emit(const CourseLoading());

    final result = await _repository.searchCourses(query);

    result.fold(
      (error) {
        emit(CourseError(message: error));
      },
      (courses) {
        if (currentState is CourseListLoaded) {
          emit(
            currentState.copyWith(
              courses: courses,
              isSearching: true,
              searchQuery: query,
            ),
          );
        } else {
          emit(
            CourseListLoaded(
              courses: courses,
              isSearching: true,
              searchQuery: query,
            ),
          );
        }
      },
    );
  }

  // PATCH: Toggle course open status
  Future<void> toggleCourseOpenStatus(int id, bool isOpen) async {
    final currentState = state;

    emit(
      const CourseOperationLoading(
        operationType: CourseOperationType.toggleOpenStatus,
      ),
    );

    final result = await _repository.toggleCourseOpenStatus(id, isOpen);

    result.fold(
      (error) {
        emit(CourseError(message: error));
      },
      (_) {
        final status = isOpen ? 'opened' : 'closed';
        emit(
          CourseOperationSuccess(
            message: 'Course $status successfully',
            previousState: currentState,
          ),
        );

        // After success, refresh the list
        _refreshAfterOperation(currentState);
      },
    );
  }

  // PATCH: Toggle course active status
  Future<void> toggleCourseStatus(int id, bool isActive) async {
    final currentState = state;

    emit(
      const CourseOperationLoading(
        operationType: CourseOperationType.toggleStatus,
      ),
    );

    final result = await _repository.toggleCourseStatus(id, isActive);

    result.fold(
      (error) {
        emit(CourseError(message: error));
      },
      (_) {
        final status = isActive ? 'activated' : 'deactivated';
        emit(
          CourseOperationSuccess(
            message: 'Course $status successfully',
            previousState: currentState,
          ),
        );

        // After success, refresh the list
        _refreshAfterOperation(currentState);
      },
    );
  }

  // PATCH: Update course
  Future<void> updateCourse(UpdateCourseRequest request) async {
    final currentState = state;

    emit(
      const CourseOperationLoading(operationType: CourseOperationType.update),
    );

    final result = await _repository.updateCourse(request);

    result.fold(
      (error) {
        emit(CourseError(message: error));
      },
      (course) {
        emit(
          CourseOperationSuccess(
            message: 'Course updated successfully',
            course: course,
            previousState: currentState,
          ),
        );

        // After success, refresh the list
        _refreshAfterOperation(currentState);
      },
    );
  }

  // Helper to refresh after operation
  void _refreshAfterOperation(CourseState previousState) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (previousState is CourseListLoaded) {
        if (previousState.hasFilter) {
          final departmentId = int.tryParse(
            previousState.filterDepartment ?? '',
          );
          if (departmentId != null) {
            loadCoursesByDepartment(departmentId);
          } else {
            loadCourses();
          }
        } else if (previousState.hasSearchQuery) {
          searchCourses(previousState.searchQuery ?? '');
        } else {
          loadCourses();
        }
      } else if (previousState is CourseDetailLoaded) {
        loadCourseById(previousState.course.id);
      } else {
        loadCourses();
      }
    });
  }
}
