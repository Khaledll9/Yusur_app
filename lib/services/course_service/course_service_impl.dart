// lib/features/course/data/services/course_service.dart
import 'package:dio/dio.dart';

import '../../models/course_model.dart';
import '../../network/dio_client.dart';
import '../../network/dio_error_handler.dart';
import 'course_service.dart';

class CourseServiceImpl implements CourseService {
  final DioClient _dioClient;
  final String _endpoint = 'courses';

  CourseServiceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<Course> createCourse(Course course) async {
    try {
      final response = await _dioClient.post(_endpoint, data: course.toJson());

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Course.fromJson(response.data['data'] ?? response.data);
      }
      throw Exception('Failed to create course');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<void> deleteCourse(String id) async {
    try {
      final response = await _dioClient.delete('$_endpoint/$id');

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete course');
      }
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<List<Course>> getActiveCourses() async {
    try {
      final response = await _dioClient.get(
        _endpoint,
        queryParameters: {'is_active': '1'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((json) => Course.fromJson(json)).toList();
      }
      throw Exception('Failed to load active courses');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<List<Course>> getAllCourses() async {
    try {
      final response = await _dioClient.get(_endpoint);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((json) => Course.fromJson(json)).toList();
      }
      throw Exception('Failed to load courses');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<Course> getCourseById(String id) async {
    try {
      final response = await _dioClient.get('$_endpoint/$id');

      if (response.statusCode == 200) {
        return Course.fromJson(response.data['data'] ?? response.data);
      }
      throw Exception('Failed to load course');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<List<Course>> getCoursesByDepartment(String departmentId) async {
    try {
      final response = await _dioClient.get(
        'departments/$departmentId/courses',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((json) => Course.fromJson(json)).toList();
      }
      throw Exception('Failed to load department courses');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<List<Course>> searchCourses(String query) async {
    try {
      final response = await _dioClient.get(
        _endpoint,
        queryParameters: {'search': query},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((json) => Course.fromJson(json)).toList();
      }
      throw Exception('Failed to search courses');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<Course> updateCourse(String id, Course course) async {
    try {
      final response = await _dioClient.put(
        '$_endpoint/$id',
        data: course.toJson(),
      );

      if (response.statusCode == 200) {
        return Course.fromJson(response.data['data'] ?? response.data);
      }
      throw Exception('Failed to update course');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<void> updateCourseStatus(String id, bool isActive) async {
    try {
      await _dioClient.patch(
        '$_endpoint/$id/status',
        data: {'is_active': isActive},
      );
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }
}
