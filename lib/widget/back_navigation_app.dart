import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_icons.dart';

import '../utils/app_text_styles.dart';

class BackNavigationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget action;
  final String title;
  const BackNavigationAppBar({
    super.key,
    this.action = const SizedBox.shrink(),
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      title: Text(title, style: TextStyles.medium16Black),
      centerTitle: true,
      actions: [action],

      leading: IconButton(
        icon: MyAppIcons.arrowRight,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
