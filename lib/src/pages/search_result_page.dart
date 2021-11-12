import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/image_grid_view.dart';

class SearchResultsPage extends StatefulWidget {
  final List _imagesList;
  final String _inputString;
  SearchResultsPage(String inputString, List imagesList)
      : _imagesList = imagesList,
        _inputString = inputString;

  SearchResultsPageState createState() => SearchResultsPageState();
}

class SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).searchResultsTopBarText +
            '“${widget._inputString}”'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ImageGridView(widget._imagesList),
    );
  }
}
