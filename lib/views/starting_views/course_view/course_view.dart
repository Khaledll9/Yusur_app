import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/course_view/widget/custum_tab_bar_widget.dart';
import 'package:yusur_app/widget/back_navigation_app.dart';

import '../../../test_model/test_diploma.dart';
import '../../../view_models/course_cubit/course_test_cubit.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseTestCubit(),
      child: DefaultTabController(
        length: categories.length,
        child: Scaffold(
          appBar: BackNavigationAppBar(
            action: Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromRGBO(250, 250, 250, 1),
              ),
              child: MyAppIcons.search,
            ),
            title: 'معهد اكاديمية الاعلام',
          ),

          body: CustomTabBar(categories: categories),
        ),
      ),
    );
  }
}
