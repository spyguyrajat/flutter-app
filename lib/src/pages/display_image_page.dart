import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/src/constants/app_constants.dart';
import 'package:image_downloader/image_downloader.dart';

import 'favorites_page.dart';

class DisplayImagePage extends StatefulWidget {
  final String _imageUrl;
  final String _imageTitle;

  DisplayImagePage(this._imageUrl, this._imageTitle);

  DisplayImagePageState createState() => DisplayImagePageState();
}

class DisplayImagePageState extends State<DisplayImagePage> {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).displayImagePageTitle),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 12.0, left: 6.0, right: 6.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              placeholder: (context, url) => Image.asset(
                imagePlaceholder,
                fit: BoxFit.contain,
              ),
              imageUrl: widget._imageUrl,
              fit: BoxFit.fill,
              width: 400.0,
              height: 400.0,
            ),
          ),
          SizedBox(height: 12.0),
          Center(
            child: Text(widget._imageTitle),
          ),
          SizedBox(height: 33.0),
          IconButton(
            icon: Icon(favoritesUrlList.contains(widget._imageUrl)
                ? Icons.favorite
                : Icons.favorite_border_sharp),
            color: Color.fromRGBO(0, 213, 127, 1),
            iconSize: 126.0,
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
                ImageDownloader.downloadImage(widget._imageUrl);
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
