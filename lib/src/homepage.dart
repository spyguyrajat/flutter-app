import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'pages/favorites_page.dart';
import 'pages/flickr_search_page.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PersistentTabController _controller;

  List<Widget> _pages() {
    return [
      FlickrSearchPage(),
      FavoritesPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _items() {
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
            '/first': (context) => FlickrSearchPage(),
            '/second': (context) => FavoritesPage(),
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
            '/first': (context) => FlickrSearchPage(),
            '/second': (context) => FavoritesPage(),
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
      controller: _controller,
      screens: _pages(),
      items: _items(),
      navBarStyle: NavBarStyle.style8,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    ));
  }
}
