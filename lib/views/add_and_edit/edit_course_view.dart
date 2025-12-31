import 'package:flutter/material.dart';
import 'package:yusur_app/models/course_model.dart';

import '../../widget/back_navigation_app.dart';
import 'widgets/add_data_body.dart';

class EditCourseView extends StatelessWidget {
  final Course course;
  const EditCourseView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavigationAppBar(title: "تعديل دورة"),
      body: AddDataBody(),
    );
  }
}
