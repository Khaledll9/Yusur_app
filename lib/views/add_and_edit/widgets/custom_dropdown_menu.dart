import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_text_styles.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      // margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: const [
          BoxShadow(
            color: AppColors.textColor,
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: DropdownButton<String>(
        hint: const Text('اختر القسم', style: TextStyles.medium14Black),
        dropdownColor: AppColors.white,
        underline: const SizedBox.shrink(),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        alignment: AlignmentGeometry.center,
        icon: const SizedBox.shrink(),
        onChanged: (value) {},
        items: ['حاسوب', 'جرافيكس', 'انجليزي', 'إدارة', 'محاسبة']
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                alignment: AlignmentGeometry.center,
                child: Text(value, style: TextStyles.medium14Black),
              );
            })
            .toList(),
      ),
    );
  }
}
