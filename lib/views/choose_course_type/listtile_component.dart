import 'package:flutter/material.dart';
import '../../utils/app_icons.dart';
import './widgets/custom_listtile.dart';

class ListTileComponent extends StatelessWidget {
  const ListTileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomListTile(icon: MyAppIcons.addCourse, title: "اضافة دورة "),
        SizedBox(height: 30),
        CustomListTile(icon: MyAppIcons.addDiploma, title: "اضافة دبلوم "),
      ],
    );
  }
}
