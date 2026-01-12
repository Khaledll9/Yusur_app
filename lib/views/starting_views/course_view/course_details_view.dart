import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_text_styles.dart';

import '../../../models/course_model.dart';
import '../../../widget/back_navigation_app.dart';

class CourseDetailsView extends StatelessWidget {
  final Course course;
  const CourseDetailsView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackNavigationAppBar(title: course.titleAr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),

              child: Image.asset(course.photoPath!),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(right: 10),
                children: [
                  const Text(
                    'عدد الطلاب المهتمين بالدورة .... طالب ',
                    style: TextStyles.bold16Black,
                  ),
                  const SizedBox(height: 20),
                  const Text('التفاصيل : ', style: TextStyles.bold16Black),

                  Text(
                    course.description!,
                    style: TextStyles.medium16Gray.copyWith(
                      color: AppColors.black80,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
