import '../../models/course_model.dart';

class CourseTestState {
  final List<Course> filteredCourses;
  final int? selectedDepartmentId;

  const CourseTestState({
    this.filteredCourses = const [],
    this.selectedDepartmentId,
  });

  CourseTestState copyWith({
    List<Course>? filteredCourses,
    int? selectedDepartmentId,
  }) {
    return CourseTestState(
      filteredCourses: filteredCourses ?? this.filteredCourses,
      selectedDepartmentId: selectedDepartmentId ?? this.selectedDepartmentId,
    );
  }
}
