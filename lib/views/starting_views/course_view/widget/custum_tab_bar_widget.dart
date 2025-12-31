import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:yusur_app/utils/app_images.dart';
import 'package:yusur_app/view_models/course_cubit/course_test_cubit.dart';
import 'package:yusur_app/view_models/course_cubit/course_test_state.dart';

import '../course_item.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> categories;

  const CustomTabBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseTestCubit, CourseTestState>(
      builder: (context, state) {
        return Column(
          children: [
            TabBar(
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

Widget _buildCourseList(BuildContext context, CourseTestState state) {
  if (state.filteredCourses.isEmpty) {
    return const Center(child: Text('لا توجد دورات في هذا القسم'));
  }

  return ListView.builder(
    itemCount: state.filteredCourses.length,
    itemBuilder: (context, index) {
      final course = state.filteredCourses[index];
      return CourseItem(
        course: course,
        customIcon: SvgPicture.asset(AppImages.assetsImagesShoppingCart),
        onTap: () {},
      );
    },
  );
}
