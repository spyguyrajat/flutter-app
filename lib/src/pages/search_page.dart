import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/src/pages/search_result_page.dart';

import '../theme/app_theme.dart';

class SearchPage extends StatefulWidget {
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool _searchButtonPress = false;
  bool _validate = false;
  final _text = TextEditingController();
  String searchValue;

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
      onSubmitted: (value) {
        setState(() {
          searchValue = value;
        });
      },
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
    setState(() {
      _text.text.length < 3 ? _validate = true : _validate = false;
    });
    _validate ? _showDialog() : _onLoading();
  }

  Future _showDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(AppLocalizations.of(context).searchValidationError),
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

  void _onLoading() {
    setState(() {
      _searchButtonPress = true;
      Future.delayed(Duration(seconds: 2), () {
        setState(() => _searchButtonPress = false);
        SetSearchResultsPage.setValue(_text.text).searchResultPage();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SearchResultsPage()));
      });
    });
  }

  static const _elevatedButtonLoadingHeight = 20.0;
  static const _elevatedButtonLoadingWidth = 20.0;
}
