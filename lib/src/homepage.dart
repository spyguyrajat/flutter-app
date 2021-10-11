import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'fragments/favoritesPage.dart';
import 'fragments/searchPage.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _index = 0;

  List _pages = [
    () => SearchPage(),
    () => FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appBarTitle),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: _pages[_index](),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppLocalizations.of(context).searchTabTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: AppLocalizations.of(context).favoritesTabTitle,
          )
        ],
        currentIndex: _index,
        onTap: _itemTap,
      ),
    );
  }

  void _itemTap(int num) {
    setState(() => _index = num);
  }
}
