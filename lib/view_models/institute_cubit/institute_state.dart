import '../../models/institute_model.dart';

final class InstituteError extends InstituteState {
  final String message;

  const InstituteError({required this.message});
}

final class InstituteInitial extends InstituteState {
  const InstituteInitial();
}

final class InstituteListLoaded extends InstituteState {
  final List<Institute> institutes;

  const InstituteListLoaded({required this.institutes});

  bool get isEmpty => institutes.isEmpty;
}

final class InstituteLoading extends InstituteState {
  const InstituteLoading();
}

sealed class InstituteState {
  const InstituteState();
}
