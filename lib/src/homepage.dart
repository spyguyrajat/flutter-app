import 'package:flutter/material.dart';

import 'fragments/favorites.dart';
import 'fragments/search.dart';

class MyHomePage extends StatefulWidget {
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int index = 0;

  void itemTap(int num) {
    setState(() => index = num);
  }

  screens(int num) {
    switch (num) {
      case 0:
        return Search();
      case 1:
        return Favorites();
      default:
        return Text('Error! Wrong Selection.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.pink,
      ),
      body: screens(index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          )
        ],
        currentIndex: index,
        onTap: itemTap,
      ),
    );
  }
}
