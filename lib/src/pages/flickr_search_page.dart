import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/src/pages/search_result_page.dart';

import '../models/assets/flickr_search_api_call.dart';
import '../theme/app_theme.dart';

class FlickrSearchPage extends StatefulWidget {
  FlickrSearchPageState createState() => FlickrSearchPageState();
}

class FlickrSearchPageState extends State<FlickrSearchPage> {
  bool _searchButtonPress = false;
  final _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appBarTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _searchTextField(),
          SizedBox(height: 20.0),
          _searchButton(),
        ],
      ),
    );
  }

  Widget _searchTextField() {
    return TextField(
      controller: _text,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).searchTextFieldTitle,
      ),
    );
  }

  Widget _searchButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            Theme.of(context).elevatedButtonTheme.style.backgroundColor,
      ),
      onPressed: _onPress,
      child: _searchButtonPress
          ? SizedBox(
              height: _elevatedButtonLoadingHeight,
              width: _elevatedButtonLoadingWidth,
              child: CircularProgressIndicator(
                color: AppTheme.searchButtonLoadingColor,
              ),
            )
          : Text(AppLocalizations.of(context).searchButtonTitle),
    );
  }

  void _onPress() {
    if (_text.text.isEmpty) {
      _showErrorDialog(AppLocalizations.of(context).emptyStringError);
    } else if (_text.text.length < 3) {
      _showErrorDialog(AppLocalizations.of(context).searchValidationError);
    } else {
      _onLoading(_text.text);
    }
  }

  Future _showErrorDialog(errorMessage) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context).okButtonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onLoading(String inputString) async {
    setState(
      () {
        _searchButtonPress = true;
      },
    );
    List<dynamic> flickrSearchPhotos =
        await FlickrSearchApiCall().searchResultsFunction(inputString);
    setState(
      () => _searchButtonPress = false,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResultsPage(
          inputString,
          flickrSearchPhotos,
        ),
      ),
    );
  }

  static const _elevatedButtonLoadingHeight = 20.0;
  static const _elevatedButtonLoadingWidth = 20.0;
}
