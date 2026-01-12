// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yusur_app/widget/custom_logout_button.dart';

class DrawerMenuView extends StatelessWidget {
  const DrawerMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF4A69FF),
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 50),
            DrawerItem(
              title: "الملف الشخصي",
              icon: Icons.person_outline,
              onTap: () {},
            ),
            const Divider(color: Colors.white24, thickness: 1, endIndent: 20),

            DrawerItem(
              title: "الحجوزات",
              icon: Icons.shopping_cart_outlined,
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
  final IconData icon;
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
          leading: Icon(icon, color: Colors.white, size: 22),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
