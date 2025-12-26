// lib/features/institute/presentation/cubit/institute_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/institute_model.dart';
import '../repositories/institute_repository/institute_repository.dart';
import 'institute_state.dart';

class InstituteCubit extends Cubit<InstituteState> {
  final InstituteRepository _repository;
  List<Institute> _allInstitutes = [];

  InstituteCubit({required InstituteRepository repository})
    : _repository = repository,
      super(InstituteState.initial()) {
    // Load initial data from cache
    _loadFromCache();
  }

  // Clear error
  void clearError() {
    if (state.hasError) {
      emit(state.copyWith(error: null));
    }
  }

  // Clear search
  void clearSearch() {
    emit(
      state.copyWith(
        institutes: _allInstitutes,
        favoriteInstitutes: _getFavorites(_allInstitutes),
        searchQuery: '',
      ),
    );
  }

  // Clear selection
  void clearSelection() {
    emit(state.copyWith(selectedInstitute: null));
  }

  // Create institute
  Future<void> createInstitute(Institute institute) async {
    try {
      emit(state.copyWith(isCreating: true, error: null));

      final createdInstitute = await _repository.createInstitute(institute);

      // Add to local list
      _allInstitutes.insert(0, createdInstitute);

      emit(
        state.copyWith(
          institutes: _applySearchFilter(_allInstitutes),
          favoriteInstitutes: _getFavorites(_allInstitutes),
          isCreating: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isCreating: false));
      rethrow;
    }
  }

  // Delete institute
  Future<void> deleteInstitute(String id) async {
    try {
      emit(state.copyWith(isDeleting: true, error: null));

      await _repository.deleteInstitute(id);

      // Remove from local list
      _allInstitutes.removeWhere((inst) => inst.id == id);

      // Clear selected institute if it's the deleted one
      final newSelectedInstitute = state.selectedInstitute?.id == id
          ? null
          : state.selectedInstitute;

      emit(
        state.copyWith(
          institutes: _applySearchFilter(_allInstitutes),
          favoriteInstitutes: _getFavorites(_allInstitutes),
          selectedInstitute: newSelectedInstitute,
          isDeleting: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isDeleting: false));
      rethrow;
    }
  }

  // Load single institute
  Future<void> loadInstitute(String id) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final institute = await _repository.getInstituteById(id);

      emit(state.copyWith(selectedInstitute: institute, isLoading: false));
    } catch (e) {
      // Try to find in cache
      final cachedInstitute = _allInstitutes.firstWhere(
        (inst) => inst.id == id,
        orElse: () => throw Exception('Institute not found'),
      );

      emit(
        state.copyWith(selectedInstitute: cachedInstitute, isLoading: false),
      );
    }
  }

  // ========== PUBLIC METHODS ==========

  // Load all institutes
  Future<void> loadInstitutes() async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final institutes = await _repository.getAllInstitutes();
      _allInstitutes = institutes;

      // Cache the institutes
      await _repository.cacheInstitutes(institutes);

      emit(
        state.copyWith(
          institutes: institutes,
          favoriteInstitutes: _getFavorites(institutes),
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  // Refresh data
  Future<void> refresh() async {
    await loadInstitutes();
  }

  // Search institutes
  Future<void> searchInstitutes(String query) async {
    if (query.isEmpty) {
      emit(
        state.copyWith(
          institutes: _allInstitutes,
          favoriteInstitutes: _getFavorites(_allInstitutes),
          searchQuery: '',
        ),
      );
      return;
    }

    try {
      emit(state.copyWith(isLoading: true, searchQuery: query));

      final institutes = await _repository.searchInstitutes(query);

      emit(
        state.copyWith(
          institutes: institutes,
          favoriteInstitutes: _getFavorites(institutes),
          isLoading: false,
          searchQuery: query,
        ),
      );
    } catch (e) {
      // Fallback to local search
      final filtered = _allInstitutes.where((institute) {
        final nameAr = institute.nameAr.toLowerCase();
        final nameEn = institute.nameEn?.toLowerCase() ?? '';
        return nameAr.contains(query.toLowerCase()) ||
            nameEn.contains(query.toLowerCase());
      }).toList();

      emit(
        state.copyWith(
          institutes: filtered,
          favoriteInstitutes: _getFavorites(filtered),
          isLoading: false,
          searchQuery: query,
        ),
      );
    }
  }

  // Toggle favorite
  Future<void> toggleFavorite(String instituteId) async {
    final index = _allInstitutes.indexWhere((inst) => inst.id == instituteId);
    if (index == -1) return;

    final institute = _allInstitutes[index];
    final newFavoriteStatus = !institute.isFavorite;

    // Optimistic update
    _allInstitutes[index] = institute.copyWith(isFavorite: newFavoriteStatus);

    emit(
      state.copyWith(
        institutes: _applySearchFilter(_allInstitutes),
        favoriteInstitutes: _getFavorites(_allInstitutes),
      ),
    );

    try {
      await _repository.toggleFavorite(instituteId, newFavoriteStatus);
    } catch (e) {
      // Revert on error
      _allInstitutes[index] = institute.copyWith(
        isFavorite: !newFavoriteStatus,
      );

      emit(
        state.copyWith(
          institutes: _applySearchFilter(_allInstitutes),
          favoriteInstitutes: _getFavorites(_allInstitutes),
          error: e.toString(),
        ),
      );
      rethrow;
    }
  }

  // Update institute
  Future<void> updateInstitute(String id, Institute institute) async {
    try {
      emit(state.copyWith(isUpdating: true, error: null));

      final updatedInstitute = await _repository.updateInstitute(id, institute);

      // Update in local list
      final index = _allInstitutes.indexWhere((inst) => inst.id == id);
      if (index != -1) {
        _allInstitutes[index] = updatedInstitute;
      }

      // Update selected institute if it's the same
      final newSelectedInstitute = state.selectedInstitute?.id == id
          ? updatedInstitute
          : state.selectedInstitute;

      emit(
        state.copyWith(
          institutes: _applySearchFilter(_allInstitutes),
          favoriteInstitutes: _getFavorites(_allInstitutes),
          selectedInstitute: newSelectedInstitute,
          isUpdating: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isUpdating: false));
      rethrow;
    }
  }

  // Apply search filter
  List<Institute> _applySearchFilter(List<Institute> institutes) {
    if (state.searchQuery.isEmpty) return institutes;

    return institutes.where((institute) {
      final nameAr = institute.nameAr.toLowerCase();
      final nameEn = institute.nameEn?.toLowerCase() ?? '';
      return nameAr.contains(state.searchQuery.toLowerCase()) ||
          nameEn.contains(state.searchQuery.toLowerCase());
    }).toList();
  }

  // Get favorites from list
  List<Institute> _getFavorites(List<Institute> institutes) {
    return institutes.where((inst) => inst.isFavorite).toList();
  }

  // Load from cache
  Future<void> _loadFromCache() async {
    try {
      final cached = await _repository.getCachedInstitutes();
      if (cached.isNotEmpty) {
        _allInstitutes = cached;

        emit(
          state.copyWith(
            institutes: cached,
            favoriteInstitutes: _getFavorites(cached),
          ),
        );
      }
    } catch (e) {
      // Silent fail for cache loading
    }
  }
}
