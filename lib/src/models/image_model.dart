class ImageModel {
  final String server;
  final String id;
  final String secret;
  final String title;

  ImageModel({
    this.id,
    this.secret,
    this.server,
    this.title,
  });

  factory ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    return ImageModel(
      server: parsedJson['server'],
      id: parsedJson['id'],
      secret: parsedJson['secret'],
      title: parsedJson['title'],
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

  String getTitle() {
    return title;
  }
}
