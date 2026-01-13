import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yusur_app/routes/app_routes.dart';

import '../../utils/app_icons.dart';
import './widgets/custom_listtile.dart';

class ListTileComponent extends StatelessWidget {
  const ListTileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          icon: MyAppIcons.addCourse,
          title: "اضافة دورة ",
          onTap: () => context.pushNamed(AppRoutes.addCourseView),
        ),
        const SizedBox(height: 30),
        CustomListTile(
          icon: MyAppIcons.addDiploma,
          title: "اضافة دبلوم ",
          onTap: () => context.pushNamed(AppRoutes.addDiplomaView),
        ),
      ],
    );
  }
}
