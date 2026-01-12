import 'package:equatable/equatable.dart';

import '../../models/course_model.dart';

final class CourseDetailLoaded extends CourseState {
  final Course course;

  const CourseDetailLoaded({required this.course});

  @override
  List<Object?> get props => [course];
}

final class CourseError extends CourseState {
  final String message;

  const CourseError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class CourseInitial extends CourseState {
  const CourseInitial();
}

final class CourseListLoaded extends CourseState {
  final List<Course> courses;
  final String? filterDepartment;
  final bool isSearching;
  final String? searchQuery;

  const CourseListLoaded({
    required this.courses,
    this.filterDepartment,
    this.isSearching = false,
    this.searchQuery,
  });

  List<Course> get activeCourses =>
      courses.where((course) => course.isActive == 1).toList();

  bool get hasFilter => filterDepartment != null;
  bool get hasSearchQuery => searchQuery?.isNotEmpty ?? false;
  bool get isEmpty => courses.isEmpty;
  List<Course> get openCourses => courses.where((c) => c.isOpen == 1).toList();
  @override
  List<Object?> get props => [
    courses,
    filterDepartment,
    isSearching,
    searchQuery,
  ];

  CourseListLoaded copyWith({
    List<Course>? courses,
    String? filterDepartment,
    bool? isSearching,
    String? searchQuery,
  }) {
    return CourseListLoaded(
      courses: courses ?? this.courses,
      filterDepartment: filterDepartment ?? this.filterDepartment,
      isSearching: isSearching ?? this.isSearching,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

final class CourseLoading extends CourseState {
  const CourseLoading();
}

final class CourseOperationLoading extends CourseState {
  final CourseOperationType operationType;

  const CourseOperationLoading({required this.operationType});

  @override
  List<Object?> get props => [operationType];
}

final class CourseOperationSuccess extends CourseState {
  final String message;
  final Course? course;
  final CourseState previousState;

  const CourseOperationSuccess({
    required this.message,
    this.course,
    required this.previousState,
  });

  @override
  List<Object?> get props => [message, course, previousState];
}

enum CourseOperationType {
  create,
  update,
  delete,
  toggleStatus,
  toggleOpenStatus,
}

sealed class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object?> get props => [];
}
