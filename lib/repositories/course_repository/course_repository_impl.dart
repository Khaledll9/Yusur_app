import 'package:dartz/dartz.dart' show Either, Right, Left;

import '../../api/api_consumer.dart';
import '../../api/errors/exceptions.dart';
import '../../models/course_model.dart' show Course;
import 'course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final ApiConsumer _apiConsumer;

  CourseRepositoryImpl({required ApiConsumer apiConsumer})
    : _apiConsumer = apiConsumer;

  // POST: Create course
  @override
  Future<Either<String, Course>> createCourse(
    CreateCourseRequest request,
  ) async {
    try {
      final response = await _apiConsumer.post(
        'courses',
        data: request.toJson(),
      );
      final course = Course.fromJson(response['data']);
      return Right(course);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return const Left('Failed to create course');
    }
  }

  @override
  Future<Either<String, void>> deleteCourse(int id) async {
    try {
      await _apiConsumer.delete('courses/$id');
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return const Left('Failed to delete course');
    }
  }

  // GET: Get course by ID
  @override
  Future<Either<String, Course>> getCourseById(int id) async {
    try {
      final response = await _apiConsumer.get('courses/$id');
      final course = Course.fromJson(response['data']);
      return Right(course);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<Course>>> getCourses() async {
    try {
      final response = await _apiConsumer.get('courses');
      final List<Course> courses = (response['data'] as List)
          .map((json) => Course.fromJson(json))
          .toList();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return const Left('Failed to load courses');
    }
  }

  @override
  Future<Either<String, List<Course>>> getCoursesByDepartment(
    int departmentId,
  ) async {
    try {
      final response = await _apiConsumer.get(
        'courses',
        queryParameters: {'department_id': departmentId},
      );
      final List<Course> courses = (response['data'] as List)
          .map((json) => Course.fromJson(json))
          .toList();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return const Left('Failed to load department courses');
    }
  }

  // GET: Search courses
  @override
  Future<Either<String, List<Course>>> searchCourses(String query) async {
    try {
      final allCoursesResult = await getCourses();
      return allCoursesResult.fold((error) => Left(error), (courses) {
        final filteredCourses = courses.where((course) {
          final searchLower = query.toLowerCase();
          return course.code.toLowerCase().contains(searchLower) ||
              course.titleAr.toLowerCase().contains(searchLower) ||
              (course.titleEn?.toLowerCase().contains(searchLower) ?? false) ||
              course.nameAr.toLowerCase().contains(searchLower) ||
              (course.nameEn?.toLowerCase().contains(searchLower) ?? false) ||
              (course.description?.toLowerCase().contains(searchLower) ??
                  false);
        }).toList();
        return Right(filteredCourses);
      });
    } catch (e) {
      return const Left('Search failed');
    }
  }

  @override
  Future<Either<String, void>> toggleCourseOpenStatus(
    int id,
    bool isOpen,
  ) async {
    try {
      await _apiConsumer.patch(
        'courses/$id',
        data: {'is_open': isOpen ? 1 : 0},
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return const Left('Failed to update course open status');
    }
  }

  @override
  Future<Either<String, void>> toggleCourseStatus(int id, bool isActive) async {
    try {
      await _apiConsumer.patch(
        'courses/$id',
        data: {'is_active': isActive ? 1 : 0},
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return const Left('Failed to update course status');
    }
  }

  @override
  Future<Either<String, Course>> updateCourse(
    UpdateCourseRequest request,
  ) async {
    try {
      final response = await _apiConsumer.patch(
        'courses/${request.id}',
        data: request.toJson(),
      );
      final course = Course.fromJson(response['data']);
      return Right(course);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return const Left('Failed to update course');
    }
  }
}

// Request DTOs for create and update
class CreateCourseRequest {
  final String code;
  final String titleAr;
  final String? titleEn;
  final String nameAr;
  final String? nameEn;
  final String? description;
  final double? price;
  final String? photoPath;
  final int departmentId;
  final int isOpen;
  final int isActive;
  final int? createdBy;

  CreateCourseRequest({
    required this.code,
    required this.titleAr,
    this.titleEn,
    required this.nameAr,
    this.nameEn,
    this.description,
    this.price,
    this.photoPath,
    required this.departmentId,
    this.isOpen = 1,
    this.isActive = 1,
    this.createdBy,
  });

  Map<String, dynamic> toJson() => {
    'code': code,
    'title_ar': titleAr,
    if (titleEn != null) 'title_en': titleEn,
    'name_ar': nameAr,
    if (nameEn != null) 'name_en': nameEn,
    if (description != null) 'description': description,
    if (price != null) 'price': price,
    if (photoPath != null) 'photo_path': photoPath,
    'department_id': departmentId,
    'is_open': isOpen,
    'is_active': isActive,
    if (createdBy != null) 'created_by': createdBy,
  };
}

class UpdateCourseRequest {
  final int id;
  final String? code;
  final String? titleAr;
  final String? titleEn;
  final String? nameAr;
  final String? nameEn;
  final String? description;
  final double? price;
  final String? photoPath;
  final int? departmentId;
  final int? isOpen;
  final int? isActive;
  final int? updatedBy;

  UpdateCourseRequest({
    required this.id,
    this.code,
    this.titleAr,
    this.titleEn,
    this.nameAr,
    this.nameEn,
    this.description,
    this.price,
    this.photoPath,
    this.departmentId,
    this.isOpen,
    this.isActive,
    this.updatedBy,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (code != null) map['code'] = code;
    if (titleAr != null) map['title_ar'] = titleAr;
    if (titleEn != null) map['title_en'] = titleEn;
    if (nameAr != null) map['name_ar'] = nameAr;
    if (nameEn != null) map['name_en'] = nameEn;
    if (description != null) map['description'] = description;
    if (price != null) map['price'] = price;
    if (photoPath != null) map['photo_path'] = photoPath;
    if (departmentId != null) map['department_id'] = departmentId;
    if (isOpen != null) map['is_open'] = isOpen;
    if (isActive != null) map['is_active'] = isActive;
    if (updatedBy != null) map['updated_by'] = updatedBy;

    return map;
  }
}
