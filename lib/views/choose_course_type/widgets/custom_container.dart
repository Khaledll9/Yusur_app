import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class CoursesBox extends StatelessWidget {
  final Widget? myimage;
  final String title;

  const CoursesBox({super.key, this.myimage, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 155,
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black80,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
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
            child: FittedBox(fit: BoxFit.cover, child: myimage),
          ),
          const SizedBox(height: 20.0),
          Text(
            title,
            style: TextStyles.medium14Black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
