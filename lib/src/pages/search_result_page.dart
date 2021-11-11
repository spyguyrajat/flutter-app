import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/image_grid_view.dart';

class SearchResultsPage extends StatefulWidget {
  final String _inputString;
  final List _imageUrlList;
  final List _imageTitleList;

  SearchResultsPage(String inputString, List imageUrlList, List imageTitleList)
      : _imageUrlList = imageUrlList,
        _imageTitleList = imageTitleList,
        _inputString = inputString;

  SearchResultsPageState createState() => SearchResultsPageState();
}

class SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).searchResultsTopBarText +
            widget._inputString),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ImageGridView(widget._imageUrlList, widget._imageTitleList),
    );
  }
}
