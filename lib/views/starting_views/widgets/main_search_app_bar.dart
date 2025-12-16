import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/widgets/search_widget.dart';

class MainSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainSearchAppBar({super.key});

  @override
  // Define the preferred size for the AppBar (80.0 matches your toolbarHeight)
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.backgroundColor,
      toolbarHeight: 80,
      elevation: 0,
      leading: IconButton(icon: MyAppIcons.menu, onPressed: () {}),
      title: const SearchWidget(),
    );
  }
}
