// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/utils/app_text_styles.dart';
import 'package:yusur_app/widget/custom_logout_button.dart';

class DrawerMenuView extends StatelessWidget {
  const DrawerMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 50),
            DrawerItem(
              title: "الملف الشخصي",
              icon: MyAppIcons.userCircle,
              onTap: () {},
            ),
            const Divider(color: Colors.white24, thickness: 1, endIndent: 20),

            DrawerItem(
              title: "الحجوزات",
              icon: MyAppIcons.shoppingCartCheck,
              onTap: () {},
            ),
            const Divider(color: Colors.white24, thickness: 1, endIndent: 20),

            const Spacer(),
            CustomLogoutButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListTile(
          leading: icon,
          title: Text(title, style: TextStyles.semiBold18Expanded),
        ),
      ),
    );
  }
}
