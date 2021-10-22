class ImageModel {
  String server;
  String id;
  String secret;
  List images = [];

  ImageModel(this.server, this.id, this.secret);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    List value = parsedJson['photos']['photo'];
    for (var i in value) {
      server = i['server'];
      id = i['id'];
      secret = i['secret'];
      var imageUrl = 'https://live.staticflickr.com/' +
          server +
          '/' +
          id +
          '_' +
          secret +
          '.jpg';
      // print(imageUrl);
      images.add(imageUrl);
    }
  }
}
