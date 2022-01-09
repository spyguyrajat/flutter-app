import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/src/constants/app_constants.dart';
import 'package:flutter_template/src/theme/app_theme.dart';

import 'favorites_page.dart';

class DisplayImagePage extends StatefulWidget {
  final String _imageUrl;
  final String _imageTitle;

  DisplayImagePage(String imageUrl, String imageTitle)
      : _imageUrl = imageUrl,
        _imageTitle = imageTitle;

  DisplayImagePageState createState() => DisplayImagePageState();
}

class DisplayImagePageState extends State<DisplayImagePage> {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).displayImagePageTitle),
      ),
      body: ListView(
        padding: EdgeInsets.only(
            top: displayImagePagePaddingTop,
            left: displayImagePagePaddingLeft,
            right: displayImagePagePaddingRight),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(imageBorderRadius),
            child: CachedNetworkImage(
              placeholder: (context, url) => Image.asset(
                imagePlaceholder,
                fit: BoxFit.contain,
              ),
              imageUrl: widget._imageUrl,
              fit: BoxFit.fill,
              width: displayImageWidth,
              height: displayImageHeight,
            ),
          ),
          SizedBox(height: sizedBoxHeightBetweenImageAndTitle),
          Center(
            child: Text(widget._imageTitle),
          ),
          SizedBox(height: sizedBoxHeightBetweenTitleAndFavorite),
          IconButton(
            icon: Icon(favoritesUrlList.contains(widget._imageUrl)
                ? Icons.favorite
                : Icons.favorite_border_sharp),
            color: AppTheme.FavoritesButtonColor,
            iconSize: favoritesButtonIconSize,
            onPressed: () {
              isFavorite = favoritesUrlList.contains(widget._imageUrl);
              if (isFavorite) {
                favoritesUrlList.remove(widget._imageUrl);
                favoritesTitleList.remove(widget._imageTitle);
                setState(
                  () {
                    isFavorite = false;
                  },
                );
              } else {
                favoritesUrlList.add(widget._imageUrl);
                favoritesTitleList.add(widget._imageTitle);
                // ImageDownloader.downloadImage(widget._imageUrl);
                setState(
                  () {
                    isFavorite = true;
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
