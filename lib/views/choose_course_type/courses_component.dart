import 'package:flutter/material.dart';
import '../../utils/app_icons.dart';
import './widgets/custom_listtile.dart';

class ListTileComponent extends StatelessWidget {
  const ListTileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AddCourseListTile(myicon: MyAppIcons.addCourse, mytitle: "اضافة دورة "),
        SizedBox(height: 30),
        AddCourseListTile(
          myicon: MyAppIcons.addCourse,
          mytitle: "اضافة دبلوم ",
        ),
      ],
    );
  }
}
