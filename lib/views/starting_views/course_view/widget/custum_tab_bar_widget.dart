import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/utils/app_images.dart';
import 'package:yusur_app/view_models/course_cubit/course_test_cubit.dart';
import 'package:yusur_app/view_models/course_cubit/course_test_state.dart';

import '../../../../test_model/test_diploma.dart';
import '../../../../utils/app_color.dart';
import '../../../../widget/custom_emptystate_body.dart';
import '../course_item.dart';

Widget _buildCourseList(BuildContext context, CourseTestState state) {
  if (state.filteredCourses.isEmpty) {
    return const CustomEmptystateBody(
      title: 'لا توجد دورات في هذا القسم',
      subTitle: 'اختر قسم اخر',
      image: AppImages.assetsImagesCalendar,
    );
  }

  return ListView.builder(
    itemCount: state.filteredCourses.length,
    itemBuilder: (context, index) {
      final course = state.filteredCourses[index];
      return CourseItem(
        course: course,
        customIcon: MyAppIcons.delete,
        textOrIcon: MyAppIcons.edit,
        onTap: () {},
      );
    },
  );
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseTestCubit, CourseTestState>(
      builder: (context, state) {
        return Column(
          children: [
            TabBar(
              overlayColor: WidgetStateProperty.all(AppColors.primary100),
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              splashFactory: InkSplash.splashFactory,
              splashBorderRadius: const BorderRadius.all(Radius.circular(12)),
              unselectedLabelColor: AppColors.black80,
              tabs: categories.map((taps) => Tab(text: taps)).toList(),
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              onTap: (index) {
                final cubit = context.read<CourseTestCubit>();

                cubit.filterByDepartment(index);
              },
            ),

            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCourseList(context, state),

                  _buildCourseList(context, state),

                  _buildCourseList(context, state),

                  _buildCourseList(context, state),

                  _buildCourseList(context, state),

                  _buildCourseList(context, state),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
