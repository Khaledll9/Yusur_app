import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:yusur_app/models/institute_model.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/course_view/widget/custum_tab_bar_widget.dart';
import 'package:yusur_app/widget/back_navigation_app.dart';

import '../../../test_model/test_diploma.dart';
import '../../../utils/app_color.dart';
import '../../../view_models/course_cubit/course_test_cubit.dart';

class CourseView extends StatelessWidget {
  final Institute institute;
  const CourseView({super.key, required this.institute});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseTestCubit(),
      child: DefaultTabController(
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
            title: institute.nameAr,
          ),

          body: const CustomTabBar(),
        ),
      ),
    );
  }
}
