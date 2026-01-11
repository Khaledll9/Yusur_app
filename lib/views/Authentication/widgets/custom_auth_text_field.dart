import 'package:flutter/material.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/app_color.dart';

class CustomAuthField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? icon;
  final bool isPassword;
  final TextEditingController controller;

  const CustomAuthField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,

                obscureText: isPassword,
                obscuringCharacter: '*',
                style: TextStyles.medium16Black,
                decoration: InputDecoration(
                  label: Text(label, style: TextStyles.bold14Black),
                  suffixIcon: icon,
                  suffixIconConstraints: const BoxConstraints(),

                  hintText: hint,
                  hintStyle: TextStyles.bold14Gray,
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textColor),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),

                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
              ),
            ),

            // لا تظهر الأيقونة إلا إذا تم تمريرها
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
