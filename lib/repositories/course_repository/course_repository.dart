import 'package:dartz/dartz.dart';

import '../../models/course_model.dart';
import 'course_repository_impl.dart';

abstract class CourseRepository {
  // POST Operations
  Future<Either<String, Course>> createCourse(CreateCourseRequest request);
  // DELETE Operations
  Future<Either<String, void>> deleteCourse(int id);
  Future<Either<String, Course>> getCourseById(int id);
  // GET Operations
  Future<Either<String, List<Course>>> getCourses();

  Future<Either<String, List<Course>>> getCoursesByDepartment(int departmentId);

  Future<Either<String, List<Course>>> searchCourses(String query);

  Future<Either<String, void>> toggleCourseOpenStatus(int id, bool isActive);

  // Utility methods
  Future<Either<String, void>> toggleCourseStatus(int id, bool isActive);
  // PATCH Operations
  Future<Either<String, Course>> updateCourse(UpdateCourseRequest request);
}
