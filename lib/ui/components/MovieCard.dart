import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/movie_model/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/ui/pages/MovieDetail.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {Key key,
      this.moviesModel,
      @required this.index,
      this.nameDisplay = true})
      : super(key: key);

  final List<MovieModel> moviesModel;
  final bool nameDisplay;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        MovieDetail(id: moviesModel[index].id)));
          },
          child: Container(
            height: 170,
            width: 130,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:
                    "https://image.tmdb.org/t/p/original${moviesModel[index].posterPath}",
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      value: downloadProgress.progress,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        if (nameDisplay)
          SizedBox(
            height: 5,
          ),
        if (nameDisplay)
          Text(
            "${moviesModel[index].title}",
            style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.white, fontSize: 10)),
          )
      ],
    );
  }
}
