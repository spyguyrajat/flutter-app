import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../api/flickr_search_api_call.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';
import 'search_result_page.dart';

class SearchPage extends StatefulWidget {
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool _searchButtonPress = false;
  final _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appBarTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      margin: EdgeInsets.all(bodyContainerMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _searchTextField(),
          SizedBox(height: bodySizedBoxHeight),
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
              height: elevatedButtonLoadingHeight,
              width: elevatedButtonLoadingWidth,
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

  void _onLoading(String inputString) async {
    setState(
      () {
        _searchButtonPress = true;
      },
    );

    List<dynamic> flickrSearchPhotos = await FlickrSearchApiCall()
        .searchResultsFunction(inputString)
        .catchError(
      (error) {
        _showErrorDialog(error);
      },
    );

    List<String> _photoUrlList = [];
    List<String> _photoTitleList = [];
    flickrSearchPhotos.forEach((element) {
      _photoUrlList.add(element[0]);
      _photoTitleList.add(element[1]);
    });

    setState(
      () => _searchButtonPress = false,
    );

    if (flickrSearchPhotos != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SearchResultsPage(
            inputString,
            _photoUrlList,
            _photoTitleList,
          ),
        ),
      );
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
}
