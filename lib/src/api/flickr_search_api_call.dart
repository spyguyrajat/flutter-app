import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constants/api_key.dart';
import '../models/image_model.dart';

class FlickrSearchApiCall {
  Future searchResultsFunction(inputString) async {
    String _url;
    Response response;
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
      response = await get(
        Uri.parse(
          _url,
        ),
      );
    } on SocketException {
      socketException();
    } catch (e) {
      debugPrint(e);
    }

    if (response.statusCode == 200) {
      List<String> flickrSearchPhotosList = [];
      try {
        Map<String, dynamic> responseBody = json.decode(response.body);
        List<Map<String, dynamic>> photoList =
            responseBody['photos']['photo'].cast<Map<String, dynamic>>();
        photoList.forEach(
          (element) {
            flickrSearchPhotosList.add(ImageModel.fromJson(element).getUrl());
          },
        );

        return flickrSearchPhotosList;
      } catch (e) {
        debugPrint(e);
      }
    } else if (response.statusCode == 400) {
      invalidRequestException();
    } else if (response.statusCode == 404) {
      error404Exception();
    } else if (response.statusCode == 500) {
      internalServerErrorException();
    } else if (response.statusCode == 504) {
      gatewayTimeOutErrorException();
    } else {
      otherException();
    }
  }
}

socketException() {
  throw ('Unable to connect to Internet');
}

invalidRequestException() {
  throw ('Invalid Request');
}

error404Exception() {
  throw ('Error 404! Not Found');
}

internalServerErrorException() {
  throw ('Internal Server Error');
}

gatewayTimeOutErrorException() {
  throw ('Gateway Timed Out! Please Try again.');
}

otherException() {
  throw ('Something went Wrong!');
}
