import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/src/constants/app_constants.dart';

import 'display_image_page.dart';

List<String> favoritesUrlList = [];
List<String> favoritesTitleList = [];
bool isFavorite = false;

class FavoritesPage extends StatefulWidget {
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  List<String> _displayFavoritesUrlList = favoritesUrlList;
  List<String> _displayFavoritesTitleList = favoritesTitleList;

  Future<void> _pullRefresh() async {
    setState(() {
      _displayFavoritesUrlList = favoritesUrlList;
      _displayFavoritesTitleList = favoritesTitleList;
    });
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).favoritesPageTitle),
      ),
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child:
            FavoritesList(_displayFavoritesUrlList, _displayFavoritesTitleList),
      ),
    );
  }
}

class FavoritesList extends StatelessWidget {
  final List<String> _favoritesUrlList;
  final List<String> _favoritesTitleList;
  FavoritesList(List favoritesUrlList, List favoritesTitleList)
      : _favoritesUrlList = favoritesUrlList,
        _favoritesTitleList = favoritesTitleList;

  Widget build(context) {
    return GridView.builder(
      itemCount: _favoritesUrlList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridViewCrossAxisCount,
        mainAxisSpacing: gridViewMainAxisSpacing,
        crossAxisSpacing: gridViewCrossAxisSpacing,
        childAspectRatio: gridViewChildAspectRatio,
      ),
      itemBuilder: (context, int index) {
        return favoritesImage(
            context, _favoritesUrlList[index], _favoritesTitleList[index]);
      },
    );
  }

  Widget favoritesImage(context, imageUrl, imageTitle) {
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
