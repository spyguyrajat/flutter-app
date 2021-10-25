import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final List imagesList;

  ImageList(this.imagesList);

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imagesList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, int index) {
        return buildImage(imagesList[index]);
      },
    );
  }

  Widget buildImage(image) {
    return Container(
      child: Image.network(image),
    );
  }
}
