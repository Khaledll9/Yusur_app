import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yusur_app/cache/shared_preferences_singleton.dart' show Prefs;
import 'package:yusur_app/generated/l10n.dart';
import 'package:yusur_app/routes/app_routes.dart';
import 'package:yusur_app/utils/app_color.dart';

import 'cubit_provider.dart';
import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Prefs.init();

  runApp(const YusurApp());
}

class YusurApp extends StatelessWidget {
  const YusurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitProviders(
      child: MaterialApp.router(
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
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
        routerConfig: AppRouter.router,
      ),
    );
  }
}
