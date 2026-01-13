// locator.dart
import 'package:get_it/get_it.dart';
import 'package:yusur_app/view_models/course_cubit/course_test_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CourseTestCubit>(
    () => CourseTestCubit()..filterByDepartment(0),
  );
}
