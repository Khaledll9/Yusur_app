import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_icons.dart';
import './widget/coustom_emptystate.dart';

class InternetProblemView extends StatelessWidget {
  const InternetProblemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EmptyStateBody(
        title: "لا يوجد اتصال بالانترنت",
        subTitle: "لا يوجد اتصال حاليا, حاول مرة اخرى ",
        iconWidget: MyAppIcons.wifi,
      ),
    );
  }
}
