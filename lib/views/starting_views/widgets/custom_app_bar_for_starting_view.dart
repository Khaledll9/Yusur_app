import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class CustomAppBarForStartingView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarForStartingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.backgroundColor,
      toolbarHeight: 80,
      elevation: 0,
      leading: IconButton(icon: MyAppIcons.menu, onPressed: () {}),
      title: Container(
        margin: const EdgeInsets.only(left: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: AppColors.backgroundColor, width: 1),
        ),
        child: const Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: MyAppIcons.search,
              hintText: 'بحث',
              hintStyle: TextStyles.medium14Gray,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 18.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // Define the preferred size for the AppBar (80.0 matches your toolbarHeight)
  Size get preferredSize => const Size.fromHeight(80.0);
}
