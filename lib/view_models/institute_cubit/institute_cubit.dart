import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import '../../models/institute_model.dart' show Institute;
import '../../repositories/institute_repository/institute_repository.dart';
import 'institute_state.dart';

class InstituteCubit extends Cubit<InstituteState> {
  final InstituteRepository _repository;

  InstituteCubit({required InstituteRepository repository})
    : _repository = repository,
      super(const InstituteInitial());

  List<Institute> get currentInstitutes {
    final currentState = state;
    if (currentState is InstituteListLoaded) {
      return currentState.institutes;
    }

    return [];
  }

  String? get errorMessage {
    final currentState = state;

    if (currentState is InstituteError) {
      return currentState.message;
    }

    return null;
  }

  int get instituteCount {
    final currentState = state;

    if (currentState is InstituteListLoaded) {
      return currentState.institutes.length;
    }
    return 0;
  }

  bool get isEmpty {
    final currentState = state;
    if (currentState is InstituteListLoaded) {
      return currentState.isEmpty;
    }
    return true;
  }

  // Check if we're currently in error state
  bool get isError => state is InstituteError;

  // Check if we're currently loading
  bool get isLoading => state is InstituteLoading;

  void clearSearch() {
    final currentState = state;

    if (currentState is InstituteListLoaded) {
      loadInstitutes();
    }
  }

  // Helper method to get institute by ID from current state
  Institute? getInstituteByIdFromState(int instituteId) {
    final currentState = state;

    if (currentState is InstituteListLoaded) {
      try {
        return currentState.institutes.firstWhere(
          (inst) => inst.id == instituteId,
        );
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  Future<void> loadInstituteById(int id) async {
    try {
      emit(const InstituteLoading());

      final result = await _repository.getInstituteById(id);

      result.fold((error) => emit(InstituteError(message: error)), (institute) {
        emit(InstituteListLoaded(institutes: [institute]));
      });
    } catch (e) {
      emit(const InstituteError(message: 'Failed to load institute details'));
    }
  }

  Future<void> loadInstitutes() async {
    try {
      emit(const InstituteLoading());

      final result = await _repository.getInstitutes();

      result.fold(
        (error) => emit(InstituteError(message: error)),
        (institutes) => emit(InstituteListLoaded(institutes: institutes)),
      );
    } catch (e) {
      emit(const InstituteError(message: 'Failed to load institutes'));
    }
  }

  // Retry loading after error
  Future<void> retry() async {
    final currentState = state;

    if (currentState is InstituteError) {
      loadInstitutes();
    }
  }
}
