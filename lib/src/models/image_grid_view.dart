import 'package:flutter/material.dart';

class ImageGridView extends StatelessWidget {
  final List<String> _imagesList;

  ImageGridView(List<String> imagesList) : _imagesList = imagesList;

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _imagesList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        childAspectRatio: 1.0,
      ),
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
