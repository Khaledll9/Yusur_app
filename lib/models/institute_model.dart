import 'package:equatable/equatable.dart';

class Institute extends Equatable {
  final String id;
  final String nameAr;
  final String? nameEn;
  final String? description;
  final String? address;
  final String? photoPath;
  final String? phone;
  final String? email;
  final String? createdAt;
  final String? updatedAt;
  final bool isFavorite;

  const Institute({
    required this.id,
    required this.nameAr,
    this.nameEn,
    this.description,
    required this.address,
    this.photoPath,
    this.phone,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.isFavorite = false,
  });

  factory Institute.fromJson(Map<String, dynamic> json) => Institute(
    id: (json['id'] as String?)!,
    nameAr: (json['name_ar'] as String?)!,
    nameEn: json['name_en'] as String?,
    description: json['description'] as String?,
    address: json['address'] as String?,
    photoPath: json['photo_path'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
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
      address,
      photoPath,
      phone,
      email,
      createdAt,
      updatedAt,
    ];
  }

  Institute copyWith({
    String? id,
    String? nameAr,
    String? nameEn,
    String? description,
    String? address,
    String? photoPath,
    String? phone,
    String? email,
    String? createdAt,
    String? updatedAt,
    bool? isFavorite,
  }) {
    return Institute(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      description: description ?? this.description,
      address: address ?? this.address,
      photoPath: photoPath ?? this.photoPath,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Institute toggleFavorite() {
    return copyWith(isFavorite: !isFavorite);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name_ar': nameAr,
    'name_en': nameEn,
    'description': description,
    'address': address,
    'photo_path': photoPath,
    'phone': phone,
    'email': email,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
