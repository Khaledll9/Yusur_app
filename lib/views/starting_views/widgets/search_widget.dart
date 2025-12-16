import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_text_styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: AppColors.backgroundColor, width: 1),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: MyAppIcons.search,
          hintText: 'بحث',
          hintStyle: TextStyles.medium14Gray,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 18.0),
        ),
      ),
    );
  }
}
