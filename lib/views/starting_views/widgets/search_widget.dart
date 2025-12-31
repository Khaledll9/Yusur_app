import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_text_styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Row(
        children: [
          MyAppIcons.search,
          SizedBox(width: 4),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'بحث',
                hintStyle: TextStyles.medium14Gray,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
