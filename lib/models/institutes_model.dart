import 'package:equatable/equatable.dart';

import 'course_model.dart';
import 'department_model.dart';
import 'employee_model.dart';
import 'user_model.dart';

class Institutes extends Equatable {
  final Institutes? institutes;
  final Course? courses;
  final Employee? employees;
  final Department? departments;
  final User? users;

  const Institutes({
    this.institutes,
    this.courses,
    this.employees,
    this.departments,
    this.users,
  });

  factory Institutes.fromJson(Map<String, dynamic> json) => Institutes(
    institutes: json['institutes'] == null
        ? null
        : Institutes.fromJson(json['institutes'] as Map<String, dynamic>),
    courses: json['courses'] == null
        ? null
        : Course.fromJson(json['courses'] as Map<String, dynamic>),
    employees: json['employees'] == null
        ? null
        : Employee.fromJson(json['employees'] as Map<String, dynamic>),
    departments: json['departments'] == null
        ? null
        : Department.fromJson(json['departments'] as Map<String, dynamic>),
    users: json['users'] == null
        ? null
        : User.fromJson(json['users'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'institutes': institutes?.toJson(),
    'courses': courses?.toJson(),
    'employees': employees?.toJson(),
    'departments': departments?.toJson(),
    'users': users?.toJson(),
  };

  Institutes copyWith({
    Institutes? institutes,
    Course? courses,
    Employee? employees,
    Department? departments,
    User? users,
  }) {
    return Institutes(
      institutes: institutes ?? this.institutes,
      courses: courses ?? this.courses,
      employees: employees ?? this.employees,
      departments: departments ?? this.departments,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props {
    return [institutes, courses, employees, departments, users];
  }
}
