import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/course_view/widget/custum_tab_bar_widget.dart';
import 'package:yusur_app/widget/back_navigation_app.dart';

import '../../../test_model/test_diploma.dart';
import '../../../utils/app_color.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: BackNavigationAppBar(
          action: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: AppColors.white80,
            ),
            child: MyAppIcons.search,
          ),
          title: 'معهد باينيرز',
        ),

        body: const CustomTabBar(),
      ),
    );
  }
}
