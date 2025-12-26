import '../../models/course_model.dart';

abstract class CourseService {
  Future<Course> createCourse(Course course);
  Future<void> deleteCourse(String id);
  Future<List<Course>> getActiveCourses();
  Future<List<Course>> getAllCourses();
  Future<Course> getCourseById(String id);
  Future<List<Course>> getCoursesByDepartment(String departmentId);
  Future<List<Course>> searchCourses(String query);
  Future<Course> updateCourse(String id, Course course);
  Future<void> updateCourseStatus(String id, bool isActive);
}
