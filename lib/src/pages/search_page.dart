import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/app_theme.dart';

class SearchPage extends StatefulWidget {
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool _searchButtonPress = false;
  bool _validate = false;
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
        errorText: _validate ? 'Please enter 3 or more characters!' : null,
      ),
    );
  }

  Widget _searchButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            Theme.of(context).elevatedButtonTheme.style.backgroundColor,
      ),
      onPressed: () {
        setState(() {
          _text.text.length < 3 ? _validate = true : _validate = false;
        });
        if (_validate == false) {
          return _onLoading();
        }
      },
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

  void _onLoading() {
    setState(() {
      _searchButtonPress = true;
      new Future.delayed(new Duration(seconds: 2), _searchResultPage);
    });
  }

  Future _searchResultPage() async {
    setState(() => _searchButtonPress = false);
  }

  static const _elevatedButtonLoadingHeight = 20.0;
  static const _elevatedButtonLoadingWidth = 20.0;
}
