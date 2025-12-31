import 'package:flutter/material.dart';

import '../../../test_model/test_institute.dart';
import 'institute_item.dart';

class InstituteItemListView extends StatelessWidget {
  const InstituteItemListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: institutes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: InstituteItem(institute: institutes[index]),
        );
      },
    );
  }
}
