import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/constants/app_constants.dart';

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
        crossAxisCount: gridViewCrossAxisCount,
        mainAxisSpacing: gridViewMainAxisSpacing,
        crossAxisSpacing: gridViewCrossAxisSpacing,
        childAspectRatio: gridViewChildAspectRatio,
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
            imagePlaceholder,
            fit: BoxFit.contain,
          ),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: gridViewImageWidth,
          height: gridViewImageHeight,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DisplayImagePage(imageUrl, imageTitle),
          ),
        );
      },
    );
  }
}
