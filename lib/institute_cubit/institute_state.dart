import 'package:equatable/equatable.dart';

import '../../models/institute_model.dart';

class InstituteState extends Equatable {
  final List<Institute> institutes;
  final List<Institute> favoriteInstitutes;
  final Institute? selectedInstitute;
  final bool isLoading;
  final String? error;
  final String searchQuery;
  final bool isCreating;
  final bool isUpdating;
  final bool isDeleting;

  const InstituteState({
    this.institutes = const [],
    this.favoriteInstitutes = const [],
    this.selectedInstitute,
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
    this.isCreating = false,
    this.isUpdating = false,
    this.isDeleting = false,
  });

  factory InstituteState.error(String error) =>
      InstituteState(error: error, isLoading: false);

  // Factory methods for different states
  factory InstituteState.initial() => const InstituteState();

  factory InstituteState.loaded(List<Institute> institutes) => InstituteState(
    institutes: institutes,
    favoriteInstitutes: institutes.where((inst) => inst.isFavorite).toList(),
    isLoading: false,
  );

  factory InstituteState.loading() => const InstituteState(isLoading: true);

  // Helper getters
  bool get hasError => error != null;

  bool get hasFavorites => favoriteInstitutes.isNotEmpty;
  bool get hasInstitutes => institutes.isNotEmpty;
  bool get isSearching => searchQuery.isNotEmpty;
  @override
  List<Object?> get props => [
    institutes,
    favoriteInstitutes,
    selectedInstitute,
    isLoading,
    error,
    searchQuery,
    isCreating,
    isUpdating,
    isDeleting,
  ];

  // Copy with method
  InstituteState copyWith({
    List<Institute>? institutes,
    List<Institute>? favoriteInstitutes,
    Institute? selectedInstitute,
    bool? isLoading,
    String? error,
    String? searchQuery,
    bool? isCreating,
    bool? isUpdating,
    bool? isDeleting,
  }) {
    return InstituteState(
      institutes: institutes ?? this.institutes,
      favoriteInstitutes: favoriteInstitutes ?? this.favoriteInstitutes,
      selectedInstitute: selectedInstitute ?? this.selectedInstitute,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      isCreating: isCreating ?? this.isCreating,
      isUpdating: isUpdating ?? this.isUpdating,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }
}
