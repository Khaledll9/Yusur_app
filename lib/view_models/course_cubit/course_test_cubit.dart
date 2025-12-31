// course_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../test_model/test_courses.dart';
import 'course_test_state.dart';

class CourseTestCubit extends Cubit<CourseTestState> {
  CourseTestCubit() : super(const CourseTestState());

  void filterByDepartment(int departmentId) {
    final filteredCourses = allCourses
        .where((course) => course.departmentId == departmentId)
        .toList();

    emit(
      state.copyWith(
        filteredCourses: filteredCourses,
        selectedDepartmentId: departmentId,
      ),
    );
  }

  void resetFilter() {
    emit(state.copyWith(filteredCourses: [], selectedDepartmentId: null));
  }
}
