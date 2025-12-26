import '../../models/institute_model.dart';
import '../../services/institute_service/institute_service.dart';
import 'institute_repository.dart';

class InstituteRepositoryImpl implements InstituteRepository {
  final InstituteService _instituteService;
  final List<Institute> _cachedInstitutes = [];

  InstituteRepositoryImpl({required InstituteService instituteService})
    : _instituteService = instituteService;

  @override
  Future<void> cacheInstitutes(List<Institute> institutes) async {
    _cachedInstitutes.clear();
    _cachedInstitutes.addAll(institutes);
  }

  @override
  Future<Institute> createInstitute(Institute institute) async {
    final createdInstitute = await _instituteService.createInstitute(institute);
    _cachedInstitutes.add(createdInstitute);
    return createdInstitute;
  }

  @override
  Future<void> deleteInstitute(String id) async {
    await _instituteService.deleteInstitute(id);
    _cachedInstitutes.removeWhere((institute) => institute.id == id);
  }

  @override
  Future<List<Institute>> getAllInstitutes() async {
    try {
      final institutes = await _instituteService.getAllInstitutes();
      await cacheInstitutes(institutes);
      return institutes;
    } catch (e) {
      // Fallback to cache if network fails
      if (_cachedInstitutes.isNotEmpty) {
        return _cachedInstitutes;
      }
      rethrow;
    }
  }

  @override
  Future<List<Institute>> getCachedInstitutes() async {
    return List.from(_cachedInstitutes);
  }

  @override
  Future<Institute> getInstituteById(String id) async {
    try {
      return await _instituteService.getInstituteById(id);
    } catch (e) {
      // Try to find in cache
      final cachedInstitute = _cachedInstitutes.firstWhere(
        (institute) => institute.id == id,
        orElse: () => throw Exception('Institute not found'),
      );
      return cachedInstitute;
    }
  }

  @override
  Future<List<Institute>> searchInstitutes(String query) async {
    if (query.isEmpty) return getAllInstitutes();

    try {
      return await _instituteService.searchInstitutes(query);
    } catch (e) {
      // Fallback to local search in cache
      return _cachedInstitutes.where((institute) {
        final nameAr = institute.nameAr.toLowerCase();
        final nameEn = institute.nameEn?.toLowerCase() ?? '';
        final searchQuery = query.toLowerCase();

        return nameAr.contains(searchQuery) || nameEn.contains(searchQuery);
      }).toList();
    }
  }

  @override
  Future<void> toggleFavorite(String instituteId, bool isFavorite) async {
    await _instituteService.toggleFavorite(instituteId, isFavorite);

    final index = _cachedInstitutes.indexWhere(
      (inst) => inst.id == instituteId,
    );
    if (index != -1) {
      _cachedInstitutes[index] = _cachedInstitutes[index].copyWith(
        isFavorite: isFavorite,
      );
    }
  }

  @override
  Future<Institute> updateInstitute(String id, Institute institute) async {
    final updatedInstitute = await _instituteService.updateInstitute(
      id,
      institute,
    );

    final index = _cachedInstitutes.indexWhere((inst) => inst.id == id);
    if (index != -1) {
      _cachedInstitutes[index] = updatedInstitute;
    }

    return updatedInstitute;
  }
}
