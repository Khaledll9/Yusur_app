import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/widget/back_navigation_app.dart';
import './widget/coustom_emptystate.dart';

class EmptyReservationView extends StatelessWidget {
  const EmptyReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavigationAppBar(title: "طلبات الحجوزات"),
      body: EmptyStateBody(
        title: "لا يوجد  حجوزات بعد ",
        subTitle: "قم بحجز دورة لتظهر هنا ",
        iconWidget: MyAppIcons.shoppingCartGray,
      ),
    );
  }
}
