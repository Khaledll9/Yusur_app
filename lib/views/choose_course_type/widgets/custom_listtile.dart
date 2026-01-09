import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';

class AddCourseListTile extends StatelessWidget {
  final Widget myicon;
  final String mytitle;
  const AddCourseListTile({
    super.key,
    required this.myicon,
    required this.mytitle,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: myicon,
      title: Text(mytitle),
      tileColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    );
  }
}
