import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';

class CustomListTile extends StatelessWidget {
  final Widget icon;
  final String title;
  const CustomListTile({super.key, required this.icon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      shadowColor: AppColors.black80,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: icon,
        title: Text(title),
        tileColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
