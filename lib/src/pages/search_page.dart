import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SearchPage extends StatefulWidget {
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool _searchButtonPress = false;

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          searchTextFormField(),
          Container(margin: EdgeInsets.only(bottom: 20.0)),
          searchButton(),
        ],
      ),
    );
  }

  Widget searchTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Search Flickr...',
      ),
    );
  }

  Widget searchButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            Theme.of(context).elevatedButtonTheme.style.backgroundColor,
      ),
      onPressed: _onLoading,
      child: _searchButtonPress
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: ColorConstants().searchButtonLoadingColor,
              ),
            )
          : Text('SEARCH'),
    );
  }

  void _onLoading() {
    setState(() {
      _searchButtonPress = true;
      new Future.delayed(new Duration(seconds: 2), searchResultPage);
    });
  }

  Future searchResultPage() async {
    setState(() => _searchButtonPress = false);
  }
}
