import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/bloc/cast_by_movie/cast_by_movie_bloc.dart';
import 'package:movie_app/ui/components/Rating.dart';
import 'package:movie_app/ui/pages/MovieDetail.dart';
import 'package:movie_app/ui/pages/Search.dart';
import 'package:movie_app/utils/FadeRoute.dart';

class CastDetail extends StatefulWidget {
  final int personId;
  final String name;
  final double populiarity;
  final String profilePath;

  CastDetail({this.personId, this.name, this.populiarity, this.profilePath});
  @override
  _CastDetailState createState() => _CastDetailState();
}

class _CastDetailState extends State<CastDetail> {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<CastByMovieBloc>(context);
    _bloc.add(FetchMovieByCastEvent(personId: widget.personId));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(FadeRoute(page: SearchPage()));
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<CastByMovieBloc, CastByMovieState>(
        builder: (context, state) {
          if (state is CastByMovieLoadingState) {
            return Center(
                child:
                    CircularProgressIndicator(backgroundColor: Colors.orange));
          }

          if (state is CastByMovieErrorState) {
            return Center(
              child: Text(
                "Error",
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is CastByMovieLoadedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: widget.profilePath != null
                                    ? "https://image.tmdb.org/t/p/original${widget.profilePath}"
                                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGyb4uoKEITC5H0mo3gEtXpr4tYRUt9Wz8vg&usqp=CAU",
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) {
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "${widget.name}",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Popularity : ",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 15,
                                      constraints: BoxConstraints(minWidth: 40),
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Center(
                                        child: Text(
                                          "${widget.populiarity}",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Movies that ${widget.name} takes part",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    for (var item in state.moviesByCastModel.castMovieList)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      MovieDetail(id: item.id)));
                        },
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white10),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 100,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: item.posterPath != null
                                        ? "https://image.tmdb.org/t/p/original${item.posterPath}"
                                        : "https://i.imgur.com/9BK7TR3.png",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) {
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 230,
                                      child: Text(
                                        item.originalTitle,
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 240,
                                      child: Text(
                                        item.overview.length > 140
                                            ? " ${item.overview.substring(1, 140)} ... "
                                            : item.overview,
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    RatingBar(
                                      ratingCount: item.voteAverage ~/ 2,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        "Vote count : ${item.voteCount}",
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            );
          }

          return CircularProgressIndicator(
            backgroundColor: Colors.blue,
          );
        },
      ),
    );
  }
}
