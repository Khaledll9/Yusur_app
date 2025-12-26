import '../../models/institute_model.dart';

abstract class InstituteRepository {
  Future<void> cacheInstitutes(List<Institute> institutes);
  Future<Institute> createInstitute(Institute institute);
  Future<void> deleteInstitute(String id);
  Future<List<Institute>> getAllInstitutes();
  Future<List<Institute>> getCachedInstitutes();
  Future<Institute> getInstituteById(String id);
  Future<List<Institute>> searchInstitutes(String query);
  Future<void> toggleFavorite(String instituteId, bool isFavorite);
  Future<Institute> updateInstitute(String id, Institute institute);
}
