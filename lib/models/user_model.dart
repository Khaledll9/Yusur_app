import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String password;
  final String? rememberToken;
  final String? createdAt;
  final String? updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.password,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: (json['id'] as String?)!,
    name: (json['name'] as String?)!,
    email: (json['email'] as String?)!,
    emailVerifiedAt: json['email_verified_at'] as String?,
    password: (json['password'] as String?)!,
    rememberToken: json['remember_token'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'email_verified_at': emailVerifiedAt,
    'password': password,
    'remember_token': rememberToken,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? password,
    String? rememberToken,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      password: password ?? this.password,
      rememberToken: rememberToken ?? this.rememberToken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      emailVerifiedAt,
      password,
      rememberToken,
      createdAt,
      updatedAt,
    ];
  }
}
