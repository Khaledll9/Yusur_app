import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_text_styles.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              maximumSize: const Size(100, 80),
              minimumSize: const Size(60, 45),
              backgroundColor: AppColors.primaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
              ),
            ),
            child: const Text('حفظ', style: TextStyles.regular16White),
          ),
        ),
        const SizedBox(width: 4),
        TextButton(
          onPressed: () {},
          child: const Text('إلغاء', style: TextStyles.medium16Black),
        ),
      ],
    );
  }
}
