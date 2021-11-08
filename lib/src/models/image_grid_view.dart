import 'package:flutter/material.dart';

class ImageGridView extends StatelessWidget {
  final List<String> _imagesList;

  ImageGridView(List<String> imagesList) : _imagesList = imagesList;

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _imagesList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, int index) {
        return buildImage(_imagesList[index]);
      },
    );
  }

  Widget buildImage(imageUrl) {
    return Container(
      padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
      child: Image.network(imageUrl),
    );
  }
}
