import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle semiBold24Expanded = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: Colors.white,
    fontFamily: 'LamaSansExpanded',
  );

  static const TextStyle semiBold18Expanded = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Colors.white,
    fontFamily: 'LamaSansExpanded',
  );

  static const TextStyle medium16Expanded = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.white,
    fontFamily: 'LamaSansExpanded',
  );

  static const TextStyle bold18 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle regular16White = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: Colors.white,
  );

  static const TextStyle bold16Black = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle medium16Gray = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.grey,
  );

  static const TextStyle medium16Black = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle medium14Black = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle medium14Gray = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.grey,
  );

  static const TextStyle bold14Black = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle bold14Gray = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.grey,
  );

  static const TextStyle medium12Gray = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Colors.grey,
  );
}
