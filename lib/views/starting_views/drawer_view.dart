import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/views/starting_views/home_view.dart';
import 'package:yusur_app/views/starting_views/widgets/drawer_menu_view.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  final controller = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 30,
      style: DrawerStyle.defaultStyle,
      showShadow: false,
      angle: 0.0,
      mainScreenScale: 0.25,
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.3),
          blurRadius: 0,
          offset: const Offset(30, 30),
        ),
      ],
      isRtl: true,
      mainScreenTapClose: true,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      menuBackgroundColor: AppColors.primaryColor,
      controller: controller,
      menuScreen: const DrawerMenuView(),
      mainScreen: const HomeView(),
    );
  }
}
