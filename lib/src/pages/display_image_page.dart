import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DisplayImagePage extends StatelessWidget {
  final String _imageUrl;
  final String _imageTitle;

  DisplayImagePage(this._imageUrl, this._imageTitle);
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        // APP LOCALIZATION NEEDED HERE
        title: Text('Search Result'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12.0, left: 6.0, right: 6.0),
        child: Column(
          children: [
            CachedNetworkImage(
              placeholder: (context, url) => Image.asset(
                'assets/placeholder.jpg',
                fit: BoxFit.contain,
              ),
              imageUrl: _imageUrl,
              fit: BoxFit.cover,
              width: 400.0,
              height: 400.0,
            ),
            SizedBox(height: 12.0),
            Text(_imageTitle),
          ],
        ),
      ),
    );
  }
}
