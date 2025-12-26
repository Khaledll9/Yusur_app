import 'package:flutter/material.dart';

import '../../widget/back_navigation_app.dart';
import 'widgets/add_data_body.dart';

class EditDiplomaView extends StatelessWidget {
  const EditDiplomaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavigationAppBar(title: "تعديل دبلوم"),
      body: AddDataBody(isCourse: false),
    );
  }
}
