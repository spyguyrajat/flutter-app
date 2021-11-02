import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../app_constants/api_key.dart';
import '../models/image_model.dart';

class FlickrSearchApiCall {
  Future searchResultsFunction(inputString) async {
    var url =
        'https://www.flickr.com/services/rest?method=flickr.photos.search&api_key=' +
            api_key +
            '&format=json&text=' +
            inputString +
            '&nojsoncallback=1';
    var response = await get(
      Uri.parse(
        url,
      ),
    );

    if (response.statusCode == 200) {
      try {
        List<String> flickrSearchPhotosList = [];
        Map<String, dynamic> responseBody = json.decode(response.body);
        List<dynamic> photoList = responseBody['photos']['photo'];
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
      throw Exception('Invalid Request');
    } else if (response.statusCode == 404) {
      throw Exception('Error 404! Not Found');
    } else if (response.statusCode == 500) {
      throw Exception('Internal Server Error');
    } else if (response.statusCode == 504) {
      throw Exception('Gateway Timed Out! Please Try again.');
    } else {
      throw Exception('Something went Wrong!');
    }
  }
}
