// lib/features/course/presentation/cubit/course_state.dart
import 'package:equatable/equatable.dart';

import '../../models/course_model.dart';

class CourseState extends Equatable {
  final List<Course> courses;
  final Course? selectedCourse;
  final bool isLoading;
  final String? error;
  final String searchQuery;
  final bool isCreating;
  final bool isUpdating;
  final bool isDeleting;
  final String? departmentId;
  final bool? isActive;
  final bool? isOpen;

  const CourseState({
    this.courses = const [],
    this.selectedCourse,
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
    this.isCreating = false,
    this.isUpdating = false,
    this.isDeleting = false,
    this.departmentId,
    this.isActive,
    this.isOpen,
  });

  factory CourseState.initial() => const CourseState();

  // Helper getters
  List<Course> get activeCourses => courses.where((course) {
    return course.isActive == '1' || course.isActive == 'true';
  }).toList();

  bool get hasCourses => courses.isNotEmpty;
  bool get hasError => error != null;
  bool get isFiltered =>
      departmentId != null || isActive != null || isOpen != null;
  bool get isSearching => searchQuery.isNotEmpty;

  List<Course> get openCourses => courses.where((course) {
    return course.isOpen == '1' || course.isOpen == 'true';
  }).toList();

  @override
  List<Object?> get props => [
    courses,
    selectedCourse,
    isLoading,
    error,
    searchQuery,
    isCreating,
    isUpdating,
    isDeleting,
    departmentId,
    isActive,
    isOpen,
  ];

  CourseState copyWith({
    List<Course>? courses,
    Course? selectedCourse,
    bool? isLoading,
    String? error,
    String? searchQuery,
    bool? isCreating,
    bool? isUpdating,
    bool? isDeleting,
    String? departmentId,
    bool? isActive,
    bool? isOpen,
  }) {
    return CourseState(
      courses: courses ?? this.courses,
      selectedCourse: selectedCourse ?? this.selectedCourse,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      isCreating: isCreating ?? this.isCreating,
      isUpdating: isUpdating ?? this.isUpdating,
      isDeleting: isDeleting ?? this.isDeleting,
      departmentId: departmentId ?? this.departmentId,
      isActive: isActive ?? this.isActive,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}
