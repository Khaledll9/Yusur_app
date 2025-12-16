import 'package:flutter/material.dart';

import 'widgets/add_data_body.dart';
import 'widgets/back_navigation_app_bar.dart';

class AddDiplomaView extends StatelessWidget {
  const AddDiplomaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavigationAppBar(title: "إضافة دبلوم"),
      body: AddDataBody(isCourse: false),
    );
  }
}
