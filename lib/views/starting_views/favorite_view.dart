import 'package:flutter/material.dart';
import 'package:yusur_app/test_model/test_institute.dart';

import 'widgets/institute_item.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteItems = institutes
        .where((institute) => institute.isFavorite)
        .toList();
    return ListView.builder(
      itemCount: favoriteItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: InstituteItem(institute: favoriteItems[index]),
        );
      },
    );
  }
}
