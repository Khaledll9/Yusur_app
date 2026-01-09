import 'package:flutter/material.dart';
import 'choose_coursesType.dart';
import '../../widget/back_navigation_app.dart';

class EmployeeChooseCoursesView extends StatelessWidget {
  const EmployeeChooseCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavigationAppBar(title: "معهد اكاديمية الاعلام"),
      body: ChooseCoursestypeBody(isSelected: true),
    );
  }
}
