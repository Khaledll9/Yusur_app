import 'package:flutter/material.dart';
import 'choose_coursesType.dart';
import '../../widget/back_navigation_app.dart';

class StudentChooseCoursesView extends StatelessWidget {
  const StudentChooseCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavigationAppBar(title: "معهد اكاديمية الاعلام"),
      body: ChooseCoursestypeBody(),
    );
  }
}
