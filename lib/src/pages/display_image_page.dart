import 'package:flutter/material.dart';
import 'package:flutter_template/src/constants/app_constants.dart';

class DisplayImagePage extends StatelessWidget {
  final String _imageUrl;

  DisplayImagePage(this._imageUrl);
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        // APP LOCALIZATION NEEDED HERE
        title: Text('Search Result'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.network(_imageUrl),
            SizedBox(height: bodySizedBoxHeight),
            Text('Dummy Image Title'),
          ],
        ),
      ),
    );
  }
}
