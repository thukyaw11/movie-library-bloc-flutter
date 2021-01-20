import 'package:flutter/material.dart';
import 'package:movie_app/network/models/movie_model/movies_model.dart';
import 'package:movie_app/ui/components/MovieCard.dart';

class MovieRowList extends StatelessWidget {
  final MoviesModel allMoviesModel;

  MovieRowList({this.allMoviesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13),
      height: 220,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: allMoviesModel.movie.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(
            index: index,
            moviesModel: allMoviesModel.movie,
          );
        },
      ),
    );
  }
}
