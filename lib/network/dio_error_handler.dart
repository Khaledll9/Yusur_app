// Error handling
import 'package:dio/dio.dart';

import 'exceptions.dart';

Exception dioErrorHandler(DioException e) {
  if (e.response != null) {
    final statusCode = e.response!.statusCode;
    final errorData = e.response!.data;

    String errorMessage = 'An error occurred';

    if (errorData is Map<String, dynamic>) {
      errorMessage =
          errorData['message'] ?? errorData['error'] ?? 'Error $statusCode';
    }

    switch (statusCode) {
      case 400:
        return BadRequestException(errorMessage);
      case 401:
        return UnauthorizedException(errorMessage);
      case 403:
        return ForbiddenException(errorMessage);
      case 404:
        return NotFoundException(errorMessage);
      case 500:
        return ServerException(errorMessage);
      default:
        return Exception(errorMessage);
    }
  } else {
    return NetworkException(e.message ?? 'Network error occurred');
  }
}
