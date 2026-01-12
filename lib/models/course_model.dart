import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int id;
  final String code;
  final String titleAr;
  final String? titleEn;
  final String nameAr;
  final String? nameEn;
  final String? description;
  final double? price;
  final String? photoPath;
  final int departmentId;
  final int? isOpen;
  final int? isActive;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;

  const Course({
    required this.id,
    required this.code,
    required this.titleAr,
    this.titleEn,
    required this.nameAr,
    this.nameEn,
    this.description,
    this.price,
    this.photoPath,
    required this.departmentId,
    this.isOpen,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: (json['id'] as int?)!,
    code: (json['code'] as String?)!,
    titleAr: (json['title_ar'] as String?)!,
    titleEn: json['title_en'] as String?,
    nameAr: (json['name_ar'] as String?)!,
    nameEn: json['name_en'] as String?,
    description: json['description'] as String?,
    price: json['price'] as double?,
    photoPath: json['photo_path'] as String?,
    departmentId: (json['department_id'] as int?)!,
    isOpen: json['is_open'] as int?,
    isActive: json['is_active'] as int?,
    createdBy: json['created_by'] as int?,
    updatedBy: json['updated_by'] as int?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  @override
  List<Object?> get props {
    return [
      id,
      code,
      titleAr,
      titleEn,
      nameAr,
      nameEn,
      description,
      price,
      photoPath,
      departmentId,
      isOpen,
      isActive,
      createdBy,
      updatedBy,
      createdAt,
      updatedAt,
    ];
  }

  Course copyWith({
    int? id,
    String? code,
    String? titleAr,
    String? titleEn,
    String? nameAr,
    String? nameEn,
    String? description,
    double? price,
    String? photoPath,
    int? departmentId,
    int? isOpen,
    int? isActive,
    int? createdBy,
    int? updatedBy,
    String? createdAt,
    String? updatedAt,
  }) {
    return Course(
      id: id ?? this.id,
      code: code ?? this.code,
      titleAr: titleAr ?? this.titleAr,
      titleEn: titleEn ?? this.titleEn,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      description: description ?? this.description,
      price: price ?? this.price,
      photoPath: photoPath ?? this.photoPath,
      departmentId: departmentId ?? this.departmentId,
      isOpen: isOpen ?? this.isOpen,
      isActive: isActive ?? this.isActive,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'title_ar': titleAr,
    'title_en': titleEn,
    'name_ar': nameAr,
    'name_en': nameEn,
    'description': description,
    'price': price,
    'photo_path': photoPath,
    'department_id': departmentId,
    'is_open': isOpen,
    'is_active': isActive,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
