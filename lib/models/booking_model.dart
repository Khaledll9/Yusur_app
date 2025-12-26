import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final String id;
  final String userId;
  final String? courseId;
  final String originalPrice;
  final String? discountAmount;
  final String finalPrice;
  final String? isPaid;
  final String? paymentDetails;
  final String bookingDate;
  final String? createdAt;
  final String? updatedAt;
  final String? diplomaId;

  const Booking({
    required this.id,
    required this.userId,
    this.courseId,
    required this.originalPrice,
    this.discountAmount,
    required this.finalPrice,
    this.isPaid,
    this.paymentDetails,
    required this.bookingDate,
    this.createdAt,
    this.updatedAt,
    this.diplomaId,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: (json['id'] as String?)!,
    userId: (json['user_id'] as String?)!,
    courseId: json['course_id'] as String?,
    originalPrice: (json['original_price'] as String?)!,
    discountAmount: json['discount_amount'] as String?,
    finalPrice: (json['final_price'] as String?)!,
    isPaid: json['is_paid'] as String?,
    paymentDetails: json['payment_details'] as String?,
    bookingDate: (json['enrollment_date'] as String?)!,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    diplomaId: json['diploma_id'] as String?,
  );

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      courseId,
      originalPrice,
      discountAmount,
      finalPrice,
      isPaid,
      paymentDetails,
      bookingDate,
      createdAt,
      updatedAt,
      diplomaId,
    ];
  }

  Booking copyWith({
    String? id,
    String? userId,
    String? courseId,
    String? originalPrice,
    String? discountAmount,
    String? finalPrice,
    String? isPaid,
    String? paymentDetails,
    String? enrollmentDate,
    String? createdAt,
    String? updatedAt,
    String? diplomaId,
  }) {
    return Booking(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      courseId: courseId ?? this.courseId,
      originalPrice: originalPrice ?? this.originalPrice,
      discountAmount: discountAmount ?? this.discountAmount,
      finalPrice: finalPrice ?? this.finalPrice,
      isPaid: isPaid ?? this.isPaid,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      bookingDate: enrollmentDate ?? bookingDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      diplomaId: diplomaId ?? this.diplomaId,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'course_id': courseId,
    'original_price': originalPrice,
    'discount_amount': discountAmount,
    'final_price': finalPrice,
    'is_paid': isPaid,
    'payment_details': paymentDetails,
    'enrollment_date': bookingDate,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'diploma_id': diplomaId,
  };
}
