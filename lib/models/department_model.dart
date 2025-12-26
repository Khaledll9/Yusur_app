import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final String id;
  final String nameAr;
  final String? nameEn;
  final String? description;
  final String instituteId;
  final String? isActive;
  final String? createdAt;
  final String? updatedAt;

  const Department({
    required this.id,
    required this.nameAr,
    this.nameEn,
    this.description,
    required this.instituteId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: (json['id'] as String?)!,
    nameAr: (json['name_ar'] as String?)!,
    nameEn: json['name_en'] as String?,
    description: json['description'] as String?,
    instituteId: (json['institute_id'] as String?)!,
    isActive: json['is_active'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  @override
  List<Object?> get props {
    return [
      id,
      nameAr,
      nameEn,
      description,
      instituteId,
      isActive,
      createdAt,
      updatedAt,
    ];
  }

  Department copyWith({
    String? id,
    String? nameAr,
    String? nameEn,
    String? description,
    String? instituteId,
    String? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return Department(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      description: description ?? this.description,
      instituteId: instituteId ?? this.instituteId,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name_ar': nameAr,
    'name_en': nameEn,
    'description': description,
    'institute_id': instituteId,
    'is_active': isActive,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
