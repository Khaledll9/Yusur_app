import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';

import '../../../utils/app_text_styles.dart';
class OnboardingActionCard extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final VoidCallback onNext;

  const OnboardingActionCard({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 24, 30, 40),
      decoration: const BoxDecoration(
        color:AppColors.backgroundColor,
     borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50),
    topRight: Radius.circular(50),
),

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalCount, (index) => _buildDot(index == currentIndex)),
          ),
          const SizedBox(height: 35),
          // Dynamic Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 0,
              ),
              onPressed: onNext,
              child: Text(
                currentIndex == totalCount - 1 ? "دخول" : "التالي",
                style: TextStyles.semiBold24Expanded,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor:
      AppColors.lightPrimaryColor
        ,borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
