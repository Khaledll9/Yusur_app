import 'package:equatable/equatable.dart';

class Like extends Equatable {
  final String id;
  final String userId;
  final String favorableType;
  final String favorableId;
  final String? createdAt;
  final String? updatedAt;

  const Like({
    required this.id,
    required this.userId,
    required this.favorableType,
    required this.favorableId,
    this.createdAt,
    this.updatedAt,
  });

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    id: (json['id'] as String?)!,
    userId: (json['user_id'] as String?)!,
    favorableType: (json['favorable_type'] as String?)!,
    favorableId: (json['favorable_id'] as String?)!,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  @override
  List<Object?> get props {
    return [id, userId, favorableType, favorableId, createdAt, updatedAt];
  }

  Like copyWith({
    String? id,
    String? userId,
    String? favorableType,
    String? favorableId,
    String? createdAt,
    String? updatedAt,
  }) {
    return Like(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      favorableType: favorableType ?? this.favorableType,
      favorableId: favorableId ?? this.favorableId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'favorable_type': favorableType,
    'favorable_id': favorableId,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
