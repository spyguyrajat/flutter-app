import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';

import '../models/image_model.dart';
import 'favorites_page.dart';
import 'search_page.dart';

class SearchResultsPage extends StatefulWidget {
  final String searchWord;
  SearchResultsPage(this.searchWord);

  SearchResultsPageState createState() => SearchResultsPageState();
}

class SearchResultsPageState extends State<SearchResultsPage> {
  int _index = 0;
  List fetchImage;

  final List<Function> _pages = [
    () => SearchPage(),
    () => FavoritesPage(),
  ];

  void initState() {
    super.initState();
    searchResultPage();
  }

  searchResultPage() async {
    var response = await get(
      Uri.parse(
        'https://www.flickr.com/services/rest?method=flickr.photos.search&api_key=6b6afbc32887639b60f16f4f0cb3d83a&format=json&text=' +
            widget.searchWord +
            '&nojsoncallback=1',
      ),
    );
    // print(widget.searchWord);
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      fetchImage = imageModel.images;
    });

    // print(fetchImage.length);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Results for: ' + '\"' + widget.searchWord + '\"'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ImageList(fetchImage),
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
