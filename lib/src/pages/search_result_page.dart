import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';

import '../models/image_model.dart';
import 'favorites_page.dart';
import 'search_page.dart';

class SetSearchResultsPage {
  String searchTerm = 'dummy';
  SetSearchResultsPage();

  SetSearchResultsPage.setValue(this.searchTerm);

  searchResultPage() async {
    var response = await get(
      Uri.parse(
        'https://www.flickr.com/services/rest?method=flickr.photos.search&api_key=6b6afbc32887639b60f16f4f0cb3d83a&format=json&text=' +
            searchTerm +
            '&nojsoncallback=1',
      ),
    );
    print(searchTerm);
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    List fetchImage = imageModel.images;
    print(fetchImage.length);
  }
}

class SearchResultsPage extends StatefulWidget {
  SearchResultsPageState createState() => SearchResultsPageState();
}

class SearchResultsPageState extends State<SearchResultsPage> {
  int _index = 0;

  final List<Function> _pages = [
    () => SearchPage(),
    () => FavoritesPage(),
  ];

  String get searchTerm => SetSearchResultsPage().searchTerm;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Search for: ' + searchTerm),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: (_index == 1)
          ? _pages[_index]()
          : new Center(
              child: new Text("SECOND VIEW"),
            ),
      // body: ImageList(imageModel),
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
