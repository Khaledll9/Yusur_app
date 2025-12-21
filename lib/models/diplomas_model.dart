import 'package:equatable/equatable.dart';

class Diploma extends Equatable {
  final String? id;
  final String? code;
  final String? titleAr;
  final String? titleEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final String? totalCost;
  final String? photoPath;
  final String? isActive;
  final String? isOpen;
  final String? instituteId;
  final String? createdBy;
  final String? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final String? category;

  const Diploma({
    this.id,
    this.code,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.totalCost,
    this.photoPath,
    this.isActive,
    this.isOpen,
    this.instituteId,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Diploma.fromJson(Map<String, dynamic> json) => Diploma(
    id: json['id'] as String?,
    code: json['code'] as String?,
    titleAr: json['title_ar'] as String?,
    titleEn: json['title_en'] as String?,
    descriptionAr: json['description_ar'] as String?,
    descriptionEn: json['description_en'] as String?,
    totalCost: json['total_cost'] as String?,
    photoPath: json['photo_path'] as String?,
    isActive: json['is_active'] as String?,
    isOpen: json['is_open'] as String?,
    instituteId: json['institute_id'] as String?,
    createdBy: json['created_by'] as String?,
    updatedBy: json['updated_by'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'title_ar': titleAr,
    'title_en': titleEn,
    'description_ar': descriptionAr,
    'description_en': descriptionEn,
    'total_cost': totalCost,
    'photo_path': photoPath,
    'is_active': isActive,
    'is_open': isOpen,
    'institute_id': instituteId,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  Diploma copyWith({
    String? id,
    String? code,
    String? titleAr,
    String? titleEn,
    String? descriptionAr,
    String? descriptionEn,
    String? totalCost,
    String? photoPath,
    String? isActive,
    String? isOpen,
    String? instituteId,
    String? createdBy,
    String? updatedBy,
    String? createdAt,
    String? updatedAt,
  }) {
    return Diploma(
      id: id ?? this.id,
      code: code ?? this.code,
      titleAr: titleAr ?? this.titleAr,
      titleEn: titleEn ?? this.titleEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      totalCost: totalCost ?? this.totalCost,
      photoPath: photoPath ?? this.photoPath,
      isActive: isActive ?? this.isActive,
      isOpen: isOpen ?? this.isOpen,
      instituteId: instituteId ?? this.instituteId,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? category,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      code,
      titleAr,
      titleEn,
      descriptionAr,
      descriptionEn,
      totalCost,
      photoPath,
      isActive,
      isOpen,
      instituteId,
      createdBy,
      updatedBy,
      createdAt,
      updatedAt,
      category,
    ];
  }
}
