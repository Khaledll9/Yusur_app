import 'package:flutter/material.dart';

import '../../../models/course_model.dart';
import '../../../widget/back_navigation_app.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackNavigationAppBar(title: course.titleAr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),

              child: Image.asset(course.photoPath!),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  const Text('عدد الطلاب المهتمين بالدورة .... طالب '),
                  Text(course.description!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
