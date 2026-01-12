import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:yusur_app/api/errors/exceptions.dart' show ServerException;
import 'package:yusur_app/models/institute_model.dart' show Institute;
import 'package:yusur_app/repositories/institute_repository/institute_repository.dart'
    show InstituteRepository;

import '../../api/api_consumer.dart';

class InstituteRepositoryImpl implements InstituteRepository {
  final ApiConsumer _apiConsumer;

  InstituteRepositoryImpl({required ApiConsumer apiConsumer})
    : _apiConsumer = apiConsumer;

  @override
  Future<Either<String, Institute>> getInstituteById(int id) async {
    try {
      final response = await _apiConsumer.get('institutes/$id');
      final institute = Institute.fromJson(response['data']);
      return Right(institute);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<Institute>>> getInstitutes() async {
    try {
      final response = await _apiConsumer.get('institutes');
      final List<Institute> institutes = (response['data'] as List)
          .map((json) => Institute.fromJson(json))
          .toList();
      return Right(institutes);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return const Left('Failed to load institutes');
    }
  }

  @override
  Future<Either<String, List<Institute>>> searchInstitutes(String query) async {
    try {
      final allInstitutesResult = await getInstitutes();
      return allInstitutesResult.fold((error) => Left(error), (institutes) {
        final filteredInstitutes = institutes.where((institute) {
          final searchLower = query.toLowerCase();
          return institute.nameAr.toLowerCase().contains(searchLower) ||
              (institute.nameEn?.toLowerCase().contains(searchLower) ??
                  false) ||
              (institute.description?.toLowerCase().contains(searchLower) ??
                  false) ||
              (institute.address?.toLowerCase().contains(searchLower) ?? false);
        }).toList();
        return Right(filteredInstitutes);
      });
    } catch (e) {
      return const Left('Search failed');
    }
  }
}











// import '../../models/institute_model.dart';
// import '../../services/institute_service/institute_service.dart';
// import 'institute_repository.dart';

// class InstituteRepositoryImpl implements InstituteRepository {
//   final InstituteService _instituteService;
//   final List<Institute> _cachedInstitutes = [];

//   InstituteRepositoryImpl({required InstituteService instituteService})
//     : _instituteService = instituteService;

//   @override
//   Future<void> cacheInstitutes(List<Institute> institutes) async {
//     _cachedInstitutes.clear();
//     _cachedInstitutes.addAll(institutes);
//   }

//   @override
//   Future<Institute> createInstitute(Institute institute) async {
//     final createdInstitute = await _instituteService.createInstitute(institute);
//     _cachedInstitutes.add(createdInstitute);
//     return createdInstitute;
//   }

//   @override
//   Future<void> deleteInstitute(String id) async {
//     await _instituteService.deleteInstitute(id);
//     _cachedInstitutes.removeWhere((institute) => institute.id == id);
//   }

//   @override
//   Future<List<Institute>> getAllInstitutes() async {
//     try {
//       final institutes = await _instituteService.getAllInstitutes();
//       await cacheInstitutes(institutes);
//       return institutes;
//     } catch (e) {
//       // Fallback to cache if network fails
//       if (_cachedInstitutes.isNotEmpty) {
//         return _cachedInstitutes;
//       }
//       rethrow;
//     }
//   }

//   @override
//   Future<List<Institute>> getCachedInstitutes() async {
//     return List.from(_cachedInstitutes);
//   }

//   @override
//   Future<Institute> getInstituteById(String id) async {
//     try {
//       return await _instituteService.getInstituteById(id);
//     } catch (e) {
//       // Try to find in cache
//       final cachedInstitute = _cachedInstitutes.firstWhere(
//         (institute) => institute.id == id,
//         orElse: () => throw Exception('Institute not found'),
//       );
//       return cachedInstitute;
//     }
//   }

//   @override
//   Future<List<Institute>> searchInstitutes(String query) async {
//     if (query.isEmpty) return getAllInstitutes();

//     try {
//       return await _instituteService.searchInstitutes(query);
//     } catch (e) {
//       // Fallback to local search in cache
//       return _cachedInstitutes.where((institute) {
//         final nameAr = institute.nameAr.toLowerCase();
//         final nameEn = institute.nameEn?.toLowerCase() ?? '';
//         final searchQuery = query.toLowerCase();

//         return nameAr.contains(searchQuery) || nameEn.contains(searchQuery);
//       }).toList();
//     }
//   }

//   @override
//   Future<void> toggleFavorite(String instituteId, bool isFavorite) async {
//     await _instituteService.toggleFavorite(instituteId, isFavorite);

//     final index = _cachedInstitutes.indexWhere(
//       (inst) => inst.id == instituteId,
//     );
//     if (index != -1) {
//       _cachedInstitutes[index] = _cachedInstitutes[index].copyWith(
//         isFavorite: isFavorite,
//       );
//     }
//   }

//   @override
//   Future<Institute> updateInstitute(String id, Institute institute) async {
//     final updatedInstitute = await _instituteService.updateInstitute(
//       id,
//       institute,
//     );

//     final index = _cachedInstitutes.indexWhere((inst) => inst.id == id);
//     if (index != -1) {
//       _cachedInstitutes[index] = updatedInstitute;
//     }

//     return updatedInstitute;
//   }
// }