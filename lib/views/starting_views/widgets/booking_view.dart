import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_images.dart';
import 'package:yusur_app/widget/back_navigation_app.dart';
import 'package:yusur_app/widget/custom_emptystate_body.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackNavigationAppBar(title: 'الحجوزات'),
      body: CustomEmptystateBody(
        title: 'لا يوجد حجوزات بعد',
        subTitle: 'قم بحجز دورة لتظهر هنا',
        image: AppImages.assetsImagesCart,
      ),
    );
  }
}
