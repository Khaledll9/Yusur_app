import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class CustomContainer extends StatelessWidget {
  final Widget? image;
  final String title;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    this.image,
    required this.title,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 155,
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.black80,
              spreadRadius: -12,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: FittedBox(fit: BoxFit.cover, child: image),
            ),
            const SizedBox(height: 20.0),
            Text(
              title,
              style: TextStyles.medium14Black,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
