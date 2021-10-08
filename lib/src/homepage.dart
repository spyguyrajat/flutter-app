import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'fragments/favoritesPage.dart';
import 'fragments/searchPage.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).searchTopBar),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: screens(_index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppLocalizations.of(context).searchTab,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: AppLocalizations.of(context).favoritesTab,
          )
        ],
        currentIndex: _index,
        onTap: _itemTap,
      ),
    );
  }

  screens(int index) {
    switch (index) {
      case 0:
        return SearchPage();
      case 1:
        return FavoritesPage();
      default:
        return Text('Error! Wrong Selection.');
    }
  }

  void _itemTap(int num) {
    setState(() => _index = num);
  }
}
