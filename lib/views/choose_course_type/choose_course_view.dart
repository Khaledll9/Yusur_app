import 'package:flutter/material.dart';
import 'choose_course_type_body.dart';
import '../../widget/back_navigation_app.dart';

class ChooseCourseTypeView extends StatelessWidget {
  final bool isStudent;
  const ChooseCourseTypeView({super.key, required this.isStudent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavigationAppBar(title: "معهد اكاديمية الاعلام"),
      body: isStudent
          ? const ChooseCourseTypeBody()
          : const ChooseCourseTypeBody(isSelected: true),
    );
  }
}
