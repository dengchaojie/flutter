import 'package:flutter/material.dart';
import 'package:flutter_douban/model/movie_item.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'movie_top_item_view.dart';
import 'package:flutter_douban/public.dart';

class MovieTopBannerView extends StatelessWidget {

  final List<MovieTopBanner> banners;
  MovieTopBannerView(this.banners);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (banners == null) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: Screen.width,
          height: Screen.width * 0.6,
          decoration: BoxDecoration(
            color: Color(0xff3E454D),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
      );

    }
    return Container(
      color: Colors.white,
      child: CarouselSlider(
          items: banners.map((banner) {
            return Builder(
                builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    AppNavigator.pushMovieTopList(context, banner.title,
                        banner.subTitle, banner.action);
                  },
                  child: Container(
                    width: Screen.width,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: MovieTopItemView(banner.movies, banner.title,
                      banner.subTitle, banner.coverColor),
                  ),
                );
        }
        );
      }).toList(),
        aspectRatio: 15 / 9,
      ),
    );
  }


}



class MovieTopBanner{

  List<MovieItem> movies;
  String title;
  String subTitle;
  String action;
  PaletteColor coverColor;
  MovieTopBanner(this.movies, this.title, this.subTitle, this.action, this.coverColor);
}