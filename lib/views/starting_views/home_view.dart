import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/favorite_view.dart';
import 'package:yusur_app/views/starting_views/profile_view.dart';
import 'package:yusur_app/views/starting_views/widgets/main_search_app_bar.dart';

import 'widgets/Institute_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final items = [
      MyAppIcons.home,
      MyAppIcons.favoriteLightBlue,
      MyAppIcons.user,
    ];

    return Scaffold(
      appBar: const MainSearchAppBar(),
      body: [
        InstituteItemListView(),
        const FavoriteView(),
        const ProfileView(),
      ][index],

      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        height: 50,
        index: index,
        backgroundColor: Colors.transparent,
        onTap: (value) {
          setState(() {
            index = value;
            log(index.toString());
          });
        },
      ),
    );
  }
}
