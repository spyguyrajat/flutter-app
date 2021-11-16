import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../constants/api_key.dart';
import '../models/image_model.dart';
import 'exception_class.dart';

class FlickrSearchApiCall {
  Future searchResultsFunction(inputString) async {
    String _url;
    Response _response;
    List<List<String>> _flickrSearchPhotosList = [];
    _url =
        'https://www.flickr.com/services/rest?method=flickr.photos.search&api_key=' +
            api_key +
            '&format=json&text=' +
            inputString +
            '&nojsoncallback=1';
    try {
      _response = await get(
        Uri.parse(
          _url,
        ),
      );
    } on SocketException {
      throw HttpRequestException('Error: No Internet Connection');
    }

    if (_response.statusCode == 200) {
      Map<String, dynamic> _responseBody = json.decode(_response.body);
      List<Map<String, dynamic>> _photoList =
          _responseBody['photos']['photo'].cast<Map<String, dynamic>>();
      _photoList.forEach(
        (element) {
          _flickrSearchPhotosList.add(
            [
              ImageModel.fromJson(element).getUrl(),
              ImageModel.fromJson(element).getTitle()
            ],
          );
        },
      );

      return _flickrSearchPhotosList;
    } else if (_response.statusCode == 400) {
      throw InvalidRequestException('Error: Invalid Request');
    } else if (_response.statusCode == 404) {
      throw PageNotFoundException('Error 404: Page Not Found');
    } else if (_response.statusCode == 500) {
      throw InternalServerErrorException('Error: Internal Server Error');
    } else if (_response.statusCode == 504) {
      throw GatewayTimeoutException('Error: Gateway Timed Out');
    } else {
      throw UnknownException(
          'Error ${_response.statusCode}: Something went wrong!');
    }
  }
}
