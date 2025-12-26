import 'package:flutter/material.dart';

import '../../widget/back_navigation_app.dart';
import 'widgets/add_data_body.dart';

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
