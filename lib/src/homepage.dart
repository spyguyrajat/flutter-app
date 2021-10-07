import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'fragments/favoritesScreen.dart';
import 'fragments/searchScreen.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.pink,
      ),
      body: screens(_index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppLocalizations.of(context).search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: AppLocalizations.of(context).favorites,
          )
        ],
        currentIndex: _index,
        onTap: _itemTap,
      ),
    );
  }

  screens(int num) {
    switch (num) {
      case 0:
        return SearchScreen();
      case 1:
        return FavoritesScreen();
      default:
        return Text('Error! Wrong Selection.');
    }
  }

  void _itemTap(int num) {
    setState(() => _index = num);
  }
}
