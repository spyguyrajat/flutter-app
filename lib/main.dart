import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/homePage.dart';
import 'src/theme/appTheme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme().themeData,
      darkTheme: AppTheme().darkThemeData,
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
