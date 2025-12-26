import 'package:dio/dio.dart';

import '../../models/institute_model.dart';
import '../../network/dio_client.dart';
import '../../network/dio_error_handler.dart';
import 'institute_service.dart';

class InstituteServiceImpl implements InstituteService {
  final DioClient _dioClient;
  final String _endpoint = 'institutes';

  InstituteServiceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<Institute> createInstitute(Institute institute) async {
    try {
      final response = await _dioClient.post(
        _endpoint,
        data: institute.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Institute.fromJson(response.data['data'] ?? response.data);
      }
      throw Exception('Failed to create institute');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<void> deleteInstitute(String id) async {
    try {
      final response = await _dioClient.delete('$_endpoint/$id');

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete institute');
      }
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<List<Institute>> getAllInstitutes() async {
    try {
      final response = await _dioClient.get(_endpoint);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((json) => Institute.fromJson(json)).toList();
      }
      throw Exception('Failed to load institutes');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<Institute> getInstituteById(String id) async {
    try {
      final response = await _dioClient.get('$_endpoint/$id');

      if (response.statusCode == 200) {
        return Institute.fromJson(response.data['data'] ?? response.data);
      }
      throw Exception('Failed to load institute');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<List<Institute>> searchInstitutes(String query) async {
    try {
      final response = await _dioClient.get(
        _endpoint,
        queryParameters: {'search': query},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? response.data;
        return data.map((json) => Institute.fromJson(json)).toList();
      }
      throw Exception('Failed to search institutes');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<void> toggleFavorite(String instituteId, bool isFavorite) async {
    try {
      await _dioClient.post(
        '$_endpoint/$instituteId/favorite',
        data: {'is_favorite': isFavorite},
      );
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }

  @override
  Future<Institute> updateInstitute(String id, Institute institute) async {
    try {
      final response = await _dioClient.put(
        '$_endpoint/$id',
        data: institute.toJson(),
      );

      if (response.statusCode == 200) {
        return Institute.fromJson(response.data['data'] ?? response.data);
      }
      throw Exception('Failed to update institute');
    } on DioException catch (e) {
      throw dioErrorHandler(e);
    }
  }
}
