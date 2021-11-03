import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'constants/app_constants.dart';
import 'pages/favorites_page.dart';
import 'pages/search_page.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Widget> _homeScreenPages() {
    return [
      SearchPage(),
      FavoritesPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: AppLocalizations.of(context).searchTabTitle,
        activeColorPrimary:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        inactiveColorPrimary:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            searchRoute: (context) => SearchPage(),
            favoritesRoute: (context) => FavoritesPage(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: AppLocalizations.of(context).favoritesTabTitle,
        activeColorPrimary:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        inactiveColorPrimary:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            searchRoute: (context) => SearchPage(),
            favoritesRoute: (context) => FavoritesPage(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: _homeScreenPages(),
        items: _navBarItems(),
        navBarStyle: NavBarStyle.style8,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
    );
  }
}
