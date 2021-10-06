import 'package:flutter/material.dart';

import 'src/homepage.dart';

//  App localization package not required yet.
//  import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Don't Require App Localizations.
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,
        home: MyHomePage());
  }
}
