import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'favorites_page.dart';
import 'search_page.dart';

class SearchResultsPage extends StatefulWidget {
  final List fetchImage;
  final String searchWord;
  SearchResultsPage(this.searchWord, this.fetchImage);

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
        title: Text('Results for: ' + '\"' + widget.searchWord + '\"'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ImageList(widget.fetchImage),
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

class ImageList extends StatelessWidget {
  final List imagesList;

  ImageList(this.imagesList);

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imagesList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, int index) {
        return buildImage(imagesList[index]);
      },
    );
  }

  Widget buildImage(image) {
    return Container(
      child: Image.network(image),
    );
  }
}
