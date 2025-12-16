import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
  });
  final String hintText;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyles.medium14Gray,
        enabledBorder: _buildOutlineBorder(),
        focusedBorder: _buildOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }
}
