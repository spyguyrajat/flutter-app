import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/image_list.dart';
import 'favorites_page.dart';
import 'search_page.dart';

class SearchResultsPage extends StatefulWidget {
  final List _imagesList;
  final String _inputString;
  SearchResultsPage(this._inputString, this._imagesList);

  SearchResultsPageState createState() => SearchResultsPageState();
}

class SearchResultsPageState extends State<SearchResultsPage> {
  int _index = 0;

  final List<Function> _pages = [
    () => SearchPage(),
    () => FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Results for: ' + '\"' + widget._inputString + '\"'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: (_index == 1) ? _pages[_index]() : ImageList(widget._imagesList),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
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
