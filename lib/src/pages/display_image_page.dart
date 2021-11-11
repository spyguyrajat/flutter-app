import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DisplayImagePage extends StatefulWidget {
  final String _imageUrl;
  final String _imageTitle;

  DisplayImagePage(this._imageUrl, this._imageTitle);

  DisplayImagePageState createState() => DisplayImagePageState();
}

class DisplayImagePageState extends State<DisplayImagePage> {
  bool alreadySaved = false;
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        // APP LOCALIZATION NEEDED HERE
        title: Text('Search Result'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 12.0, left: 6.0, right: 6.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              placeholder: (context, url) => Image.asset(
                'assets/placeholder.jpg',
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
            child: Text(
              widget._imageTitle,
            ),
          ),
          SizedBox(height: 33.0),
          IconButton(
            icon: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border_sharp),
            color: Color.fromRGBO(0, 213, 127, 1),
            iconSize: 126.0,
            onPressed: () {
              setState(() {
                if (alreadySaved == false) {
                  alreadySaved = true;
                } else {
                  alreadySaved = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
