import 'package:flutter/material.dart';

import '../models/image_grid_view.dart';

class SearchResultsPage extends StatefulWidget {
  final List _imagesList;
  final String _inputString;
  SearchResultsPage(this._inputString, this._imagesList);

  SearchResultsPageState createState() => SearchResultsPageState();
}

class SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for: ' + '\"' + widget._inputString + '\"'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ImageGridView(widget._imagesList),
    );
  }
}
