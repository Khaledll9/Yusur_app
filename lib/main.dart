// ignore_for_file: unused_import

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yusur_app/generated/l10n.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/add_and_edit/add_course_view.dart';
import 'package:yusur_app/views/add_and_edit/add_diploma_view.dart';
import 'package:yusur_app/views/add_and_edit/edit_course_view.dart';
import 'package:yusur_app/views/add_and_edit/edit_diploma_view.dart';
import 'package:yusur_app/views/starting_views/favorite_view.dart';
import 'package:yusur_app/views/starting_views/home_view.dart';
import 'package:yusur_app/views/starting_views/profile_view.dart';
import 'package:yusur_app/views/starting_views/widgets/main_search_app_bar.dart';

void main() {
  runApp(const YusurApp());
}

class YusurApp extends StatelessWidget {
  const YusurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'LamaSans',
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),

      home: const EditDiplomaView(),
    );
  }
}
