import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/course_view/widget/custum_tab_bar_widget.dart';
import 'package:yusur_app/widget/back_navigation_app.dart';

import '../../../test_model/test_diploma.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackNavigationAppBar(
        action: Container(
          width: 45,
          height: 45,
          margin: const EdgeInsets.only(left: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.white80,
          ),
          child: MyAppIcons.search,
        ),
        title: 'معهد اكاديمية الاعلام',
      ),

      body: CustomTabBar(onTabChanged: (value) {}, categories: categories),
    );
  }
}
