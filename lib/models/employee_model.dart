import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String id;
  final String code;
  final String userId;
  final String instituteId;
  final String nameAr;
  final String? nameEn;
  final String? gender;
  final String? phone;
  final String? address;
  final String? jobTitle;
  final String? hireDate;
  final String? salary;
  final String? isActive;
  final String? createdAt;
  final String? updatedAt;

  const Employee({
    required this.id,
    required this.code,
    required this.userId,
    required this.instituteId,
    required this.nameAr,
    this.nameEn,
    this.gender,
    this.phone,
    this.address,
    this.jobTitle,
    this.hireDate,
    this.salary,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: (json['id'] as String?)!,
    code: (json['code'] as String?)!,
    userId: (json['user_id'] as String?)!,
    instituteId: (json['institute_id'] as String?)!,
    nameAr: (json['name_ar'] as String?)!,
    nameEn: json['name_en'] as String?,
    gender: json['gender'] as String?,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
    jobTitle: json['job_title'] as String?,
    hireDate: json['hire_date'] as String?,
    salary: json['salary'] as String?,
    isActive: json['is_active'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  @override
  List<Object?> get props {
    return [
      id,
      code,
      userId,
      instituteId,
      nameAr,
      nameEn,
      gender,
      phone,
      address,
      jobTitle,
      hireDate,
      salary,
      isActive,
      createdAt,
      updatedAt,
    ];
  }

  Employee copyWith({
    String? id,
    String? code,
    String? userId,
    String? instituteId,
    String? nameAr,
    String? nameEn,
    String? gender,
    String? phone,
    String? address,
    String? jobTitle,
    String? hireDate,
    String? salary,
    String? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return Employee(
      id: id ?? this.id,
      code: code ?? this.code,
      userId: userId ?? this.userId,
      instituteId: instituteId ?? this.instituteId,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      jobTitle: jobTitle ?? this.jobTitle,
      hireDate: hireDate ?? this.hireDate,
      salary: salary ?? this.salary,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'user_id': userId,
    'institute_id': instituteId,
    'name_ar': nameAr,
    'name_en': nameEn,
    'gender': gender,
    'phone': phone,
    'address': address,
    'job_title': jobTitle,
    'hire_date': hireDate,
    'salary': salary,
    'is_active': isActive,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
