import 'package:flutter/material.dart';

import '../../widget/back_navigation_app.dart';
import 'choose_course_type_body.dart';

class ChooseCourseTypeView extends StatelessWidget {
  final bool isStudent;
  const ChooseCourseTypeView({super.key, required this.isStudent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackNavigationAppBar(title: "معهد اكاديمية الاعلام"),
      body: ChooseCourseTypeBody(isSelected: isStudent),
    );
  }
}
