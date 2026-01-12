import 'package:dartz/dartz.dart';
import 'package:yusur_app/models/institute_model.dart' show Institute;

abstract class InstituteRepository {
  Future<Either<String, Institute>> getInstituteById(int id);

  Future<Either<String, List<Institute>>> getInstitutes();

  Future<Either<String, List<Institute>>> searchInstitutes(String query);
}

// abstract class InstituteRepository {
//   Future<void> cacheInstitutes(List<Institute> institutes);
//   Future<Institute> createInstitute(Institute institute);
//   Future<void> deleteInstitute(String id);
//   Future<List<Institute>> getAllInstitutes();
//   Future<List<Institute>> getCachedInstitutes();
//   Future<Institute> getInstituteById(String id);
//   Future<List<Institute>> searchInstitutes(String query);
//   Future<void> toggleFavorite(String instituteId, bool isFavorite);
//   Future<Institute> updateInstitute(String id, Institute institute);
// }
