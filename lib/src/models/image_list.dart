import 'package:flutter/material.dart';

class ImageGridView extends StatelessWidget {
  final List _imagesList;

  ImageGridView(this._imagesList);

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
      child: Image.network(imageUrl),
    );
  }
}
