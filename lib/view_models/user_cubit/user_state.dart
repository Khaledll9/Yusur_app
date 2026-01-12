import 'package:yusur_app/models/user_model.dart';

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}

final class GetUserLoading extends UserState {}

final class GetUserSuccess extends UserState {
  final User user;

  GetUserSuccess({required this.user});
}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignInLoading extends UserState {}

final class SignInSuccess extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class SignUpLoading extends UserState {}

final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class UploadProfilePic extends UserState {}

final class UserInitial extends UserState {}

class UserState {}
