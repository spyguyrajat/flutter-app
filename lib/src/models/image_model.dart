class ImageModel {
  final String server;
  final String id;
  final String secret;

  ImageModel({
    this.id,
    this.secret,
    this.server,
  });

  factory ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    return ImageModel(
      server: parsedJson['server'],
      id: parsedJson['id'],
      secret: parsedJson['secret'],
    );
  }

  String getUrl() {
    return 'https://live.staticflickr.com/' +
        server +
        '/' +
        id +
        '_' +
        secret +
        '.jpg';
  }
}
