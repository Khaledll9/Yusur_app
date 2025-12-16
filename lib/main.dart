// ignore_for_file: unused_import

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yusur_app/generated/l10n.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/home_view.dart';
import 'package:yusur_app/views/starting_views/profile_view.dart';
import 'package:yusur_app/views/starting_views/favorite_view.dart';
import 'package:yusur_app/views/starting_views/widgets/custom_app_bar_for_starting_view.dart';

import 'package:yusur_app/views/starting_views/add&edit_subjects/views/add_course_view.dart';
import 'package:yusur_app/views/starting_views/add&edit_subjects/views/add_diploma_view.dart';
import 'package:yusur_app/views/starting_views/add&edit_subjects/views/edit_course_view.dart';
import 'package:yusur_app/views/starting_views/add&edit_subjects/views/edit_diploma_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'LamaSans'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),

      home: const HomeView(),
    );
  }
}
