import 'package:flutter/material.dart';

import '../../add_and_edit/widgets/add_data_body.dart';
import '../../add_and_edit/widgets/back_navigation_app_bar.dart';

class EditCourseView extends StatelessWidget {
  const EditCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavigationAppBar(title: "تعديل دورة"),
      body: AddDataBody(),
    );
  }
}
