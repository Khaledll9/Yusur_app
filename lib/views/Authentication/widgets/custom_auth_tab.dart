import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_text_styles.dart';

class CustomAuthTab extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const CustomAuthTab({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(title, style: TextStyles.bold14Black),
          const SizedBox(height: 13),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 3,
            width: isActive ? 100 : 0,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
