import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constants/api_key.dart';
import '../models/image_model.dart';

class FlickrSearchApiCall {
  Future searchResultsFunction(inputString) async {
    String _url;
    Response _response;
    List<String> _flickrSearchPhotosList = [];
    try {
      _url =
          'https://www.flickr.com/services/rest?method=flickr.photos.search&api_key=' +
              api_key +
              '&format=json&text=' +
              inputString +
              '&nojsoncallback=1';
    } catch (e) {
      debugPrint(e);
    }

    try {
      _response = await get(
        Uri.parse(
          _url,
        ),
      );
    } on SocketException {
      _socketException();
    } catch (e) {
      debugPrint(e);
    }

    if (_response.statusCode == 200) {
      try {
        Map<String, dynamic> _responseBody = json.decode(_response.body);
        List<Map<String, dynamic>> _photoList =
            _responseBody['photos']['photo'].cast<Map<String, dynamic>>();
        _photoList.forEach(
          (element) {
            _flickrSearchPhotosList.add(
              ImageModel.fromJson(element).getUrl(),
            );
          },
        );

        return _flickrSearchPhotosList;
      } catch (e) {
        debugPrint(e);
      }
    } else if (_response.statusCode == 400) {
      _invalidRequestException();
    } else if (_response.statusCode == 404) {
      _error404Exception();
    } else if (_response.statusCode == 500) {
      _internalServerErrorException();
    } else if (_response.statusCode == 504) {
      _gatewayTimeOutErrorException();
    } else {
      _otherException();
    }
  }
}

_socketException() {
  throw ('Unable to connect to Internet');
}

_invalidRequestException() {
  throw ('Invalid Request');
}

_error404Exception() {
  throw ('Error 404! Not Found');
}

_internalServerErrorException() {
  throw ('Internal Server Error');
}

_gatewayTimeOutErrorException() {
  throw ('Gateway Timed Out! Please Try again.');
}

_otherException() {
  throw ('Something went Wrong!');
}
