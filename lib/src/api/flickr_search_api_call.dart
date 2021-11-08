import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../constants/api_key.dart';
import '../models/image_model.dart';

class FlickrSearchApiCall {
  Future searchResultsFunction(inputString) async {
    final String url =
        'https://www.flickr.com/services/rest?method=flickr.photos.search&api_key=' +
            api_key +
            '&format=json&text=' +
            inputString +
            '&nojsoncallback=1';
    final response = await get(
      Uri.parse(
        url,
      ),
    );

    if (response.statusCode == 200) {
      List<String> flickrSearchPhotosList = [];
      try {
        Map<String, dynamic> responseBody = json.decode(response.body);
        List<Map<String, dynamic>> photoList =
            responseBody['photos']['photo'].cast<Map<String, dynamic>>();
        photoList.forEach(
          (element) {
            flickrSearchPhotosList.add(ImageModel.fromJson(element).makeUrl());
          },
        );

        return flickrSearchPhotosList;
      } catch (e) {
        debugPrint(e);
      }
    } else if (response.statusCode == 400) {
      return invalidRequestException();
    } else if (response.statusCode == 404) {
      return error404Exception();
    } else if (response.statusCode == 500) {
      return internalServerErrorException();
    } else if (response.statusCode == 504) {
      return gatewayTimeOutErrorException();
    } else {
      otherException();
    }
  }
}

Future invalidRequestException() {
  return Future.error('Invalid Request');
}

Future error404Exception() {
  return Future.error('Error 404! Not Found');
}

Future internalServerErrorException() {
  return Future.error('Internal Server Error');
}

Future gatewayTimeOutErrorException() {
  return Future.error('Gateway Timed Out! Please Try again.');
}

Future otherException() {
  return Future.error('Something went Wrong!');
}
