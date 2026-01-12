import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

class CustomLogoutButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomLogoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Transform.flip(flipX: true, child: MyAppIcons.logout),
        title: const Text("تسجيل خروج", style: TextStyles.semiBold18Expanded),
      ),
    );
  }
}
