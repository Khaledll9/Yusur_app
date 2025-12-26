import '../../models/course_model.dart';

abstract class CourseRepository {
  Future<void> cacheCourses(List<Course> courses);
  Future<Course> createCourse(Course course);
  Future<void> deleteCourse(String id);
  Future<List<Course>> filterCourses({
    String? departmentId,
    bool? isActive,
    bool? isOpen,
    String? searchQuery,
  });
  Future<List<Course>> getActiveCourses();

  Future<List<Course>> getAllCourses();
  Future<List<Course>> getCachedCourses();
  Future<List<Course>> getCachedCoursesByDepartment(String departmentId);
  Future<Course> getCourseById(String id);

  Future<List<Course>> getCoursesByDepartment(String departmentId);
  Future<List<Course>> searchCourses(String query);
  Future<Course> updateCourse(String id, Course course);

  Future<void> updateCourseStatus(String id, bool isActive);
}
