import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yusur_app/generated/l10n.dart';
import 'package:yusur_app/utils/app_color.dart';
import 'package:yusur_app/utils/app_icons.dart';
import 'package:yusur_app/views/starting_views/widgets/customAppBar_For_StartingView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 2;

  final items = <Widget>[MyAppIcons.home, MyAppIcons.favorite, MyAppIcons.user];

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

      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const CustomappbarForStartingview(),

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
      ),
    );
  }
}
