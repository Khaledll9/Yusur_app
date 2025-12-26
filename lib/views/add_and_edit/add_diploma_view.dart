import 'package:flutter/material.dart';

import '../../widget/back_navigation_app.dart';
import 'widgets/add_data_body.dart';

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
