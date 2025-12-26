import 'package:equatable/equatable.dart';

import '../../models/course_model.dart';

class CourseState extends Equatable {
  final List<Course> courses;
  final Course? selectedCourse;
  final bool isLoading;
  final bool isLoadingActive;
  final bool isLoadingOpen;
  final bool isLoadingFiltered;
  final String? error;
  final String searchQuery;
  final bool isCreating;
  final bool isUpdating;
  final bool isDeleting;
  final bool isTogglingStatus;
  final String? departmentId;
  final bool? isActive;
  final bool? isOpen;

  const CourseState({
    this.courses = const [],
    this.selectedCourse,
    this.isLoading = false,
    this.isLoadingActive = false,
    this.isLoadingOpen = false,
    this.isLoadingFiltered = false,
    this.error,
    this.searchQuery = '',
    this.isCreating = false,
    this.isUpdating = false,
    this.isDeleting = false,
    this.isTogglingStatus = false,
    this.departmentId,
    this.isActive,
    this.isOpen,
  });

  factory CourseState.initial() => const CourseState();

  List<Course> get activeCourses => courses.where((course) {
    return course.isActive == '1' || course.isActive == 'true';
  }).toList();

  bool get hasCourses => courses.isNotEmpty;
  // Helper getters
  bool get hasError => error != null;
  bool get isAnyLoading =>
      isLoading || isLoadingActive || isLoadingOpen || isLoadingFiltered;
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
    isLoadingActive,
    isLoadingOpen,
    isLoadingFiltered,
    error,
    searchQuery,
    isCreating,
    isUpdating,
    isDeleting,
    isTogglingStatus,
    departmentId,
    isActive,
    isOpen,
  ];

  CourseState copyWith({
    List<Course>? courses,
    Course? selectedCourse,
    bool? isLoading,
    bool? isLoadingActive,
    bool? isLoadingOpen,
    bool? isLoadingFiltered,
    String? error,
    String? searchQuery,
    bool? isCreating,
    bool? isUpdating,
    bool? isDeleting,
    bool? isTogglingStatus,
    String? departmentId,
    bool? isActive,
    bool? isOpen,
  }) {
    return CourseState(
      courses: courses ?? this.courses,
      selectedCourse: selectedCourse ?? this.selectedCourse,
      isLoading: isLoading ?? this.isLoading,
      isLoadingActive: isLoadingActive ?? this.isLoadingActive,
      isLoadingOpen: isLoadingOpen ?? this.isLoadingOpen,
      isLoadingFiltered: isLoadingFiltered ?? this.isLoadingFiltered,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      isCreating: isCreating ?? this.isCreating,
      isUpdating: isUpdating ?? this.isUpdating,
      isDeleting: isDeleting ?? this.isDeleting,
      isTogglingStatus: isTogglingStatus ?? this.isTogglingStatus,
      departmentId: departmentId ?? this.departmentId,
      isActive: isActive ?? this.isActive,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}
