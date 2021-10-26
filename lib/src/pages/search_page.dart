import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/src/pages/search_result_page.dart';
import 'package:http/http.dart';

import '../models/image_model.dart';
import '../theme/app_theme.dart';

class SearchPage extends StatefulWidget {
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool _searchButtonPress = false;
  final _text = TextEditingController();

  @override
  Widget build(context) {
    return _getBody();
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

  void _onLoading(String inputString) {
    setState(() {
      _searchButtonPress = true;
    });

    Future searchResultsFunction() async {
      try {
        var response = await get(
          Uri.parse(
            'https://www.flickr.com/services/rest?method=flickr.photos.search&api_key=6b6afbc32887639b60f16f4f0cb3d83a&format=json&text=' +
                inputString +
                '&nojsoncallback=1',
          ),
        );
        ImageModel imageModel = ImageModel.fromJson(json.decode(response.body));
        List _imagesList = imageModel.getList();

        setState(() => _searchButtonPress = false);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => SearchResultsPage(inputString, _imagesList)));
      } catch (errorLog) {
        print(errorLog);
      }
    }

    searchResultsFunction();
  }

  static const _elevatedButtonLoadingHeight = 20.0;
  static const _elevatedButtonLoadingWidth = 20.0;
}
