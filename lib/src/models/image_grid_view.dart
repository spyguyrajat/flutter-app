import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../pages/display_image_page.dart';

class ImageGridView extends StatelessWidget {
  final List<String> _imageUrlList;
  final List<String> _imageTitleList;

  ImageGridView(List<String> imagesList, List<String> imageTitleList)
      : _imageUrlList = imagesList,
        _imageTitleList = imageTitleList;

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _imageUrlList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, int index) {
        return buildImage(
            context, _imageUrlList[index], _imageTitleList[index]);
      },
    );
  }

  Widget buildImage(context, imageUrl, imageTitle) {
    return InkWell(
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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DisplayImagePage(imageUrl, imageTitle)));
      },
    );
  }
}
