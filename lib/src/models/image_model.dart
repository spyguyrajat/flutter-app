class ImageModel {
  String _server;
  String _id;
  String _secret;
  List _imagesList = [];

  ImageModel();

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    List value = parsedJson['photos']['photo'];
    for (var i in value) {
      _server = i['server'];
      _id = i['id'];
      _secret = i['secret'];
      var imageUrl = 'https://live.staticflickr.com/' +
          _server +
          '/' +
          _id +
          '_' +
          _secret +
          '.jpg';
      _imagesList.add(imageUrl);
    }
  }

  List getList() {
    return _imagesList;
  }
}
