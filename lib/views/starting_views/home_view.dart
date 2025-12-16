import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/profile_view.dart';
import 'package:yusur_app/views/starting_views/favorite_view.dart';
import 'package:yusur_app/views/starting_views/institutes_inforamation_view.dart';
import 'package:yusur_app/views/starting_views/widgets/custom_app_bar_for_starting_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    final screens = [
      InstitutesInforamationView(),
      const FavoriteView(),
      const ProfileView(),
    ];

    final items = [
      MyAppIcons.home,
      MyAppIcons.favoriteLihgtBlue,
      MyAppIcons.user,
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBarForStartingView(),
      body: screens[index],

      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        height: 50,
        index: index,
        backgroundColor: Colors.transparent,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
