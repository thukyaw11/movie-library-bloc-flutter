import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key key, this.moviesModel, @required this.index})
      : super(key: key);

  final List<MovieModel> moviesModel;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: 130,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
                  "https://image.tmdb.org/t/p/original${moviesModel[index].backdropPath}",
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orangeAccent,
                    value: downloadProgress.progress,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${moviesModel[index].title}",
          style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.white, fontSize: 10)),
        )
      ],
    );
  }
}
