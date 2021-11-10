import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../pages/display_image_page.dart';

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
        return buildImage(context, _imagesList[index]);
      },
    );
  }

  Widget buildImage(context, imageUrl) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => DisplayImagePage(imageUrl)));
      },
      child: Container(
        child: CachedNetworkImage(
          placeholder: (context, url) => Image.asset(
            'assets/placeholder.jpg',
            fit: BoxFit.contain,
          ),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: 133.0,
          height: 133.0,
        ),
      ),
    );
  }
}
