import '../../models/institute_model.dart';

abstract class InstituteService {
  Future<Institute> createInstitute(Institute institute);
  Future<void> deleteInstitute(String id);
  Future<List<Institute>> getAllInstitutes();
  Future<Institute> getInstituteById(String id);
  Future<List<Institute>> searchInstitutes(String query);
  Future<void> toggleFavorite(String instituteId, bool isFavorite);
  Future<Institute> updateInstitute(String id, Institute institute);
}
