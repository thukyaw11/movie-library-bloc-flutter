import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/network/models/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/network/models/bloc/movie_detail_casts/movie_detail_casts_bloc.dart';
import 'package:movie_app/network/models/bloc/reviews/reviews_bloc.dart';
import 'package:movie_app/network/models/bloc/videos/videos_bloc.dart';
import 'package:movie_app/ui/components/InfoBar.dart';
import 'package:movie_app/ui/components/MovieDetailHeading.dart';
import 'package:movie_app/ui/components/Rating.dart';
import 'package:movie_app/ui/components/ReviewList.dart';
import 'package:movie_app/ui/components/SimilarMoviesList.dart';
import 'package:movie_app/ui/components/loading/LoadingRow.dart';
import 'package:movie_app/ui/pages/VideoTrailer.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  MovieDetail({this.id});

  @override
  _MovieDetailState createState() => _MovieDetailState(id);
}

class _MovieDetailState extends State<MovieDetail> {
  final int id;
  _MovieDetailState(this.id);

  @override
  Widget build(BuildContext context) {
    final _topRateBloc = BlocProvider.of<MovieDetailBloc>(context);
    final movieDetailCast = BlocProvider.of<MovieDetailCastsBloc>(context);
    final videoTrailerBloc = BlocProvider.of<VideosBloc>(context);
    final reviewsBloc = BlocProvider.of<ReviewsBloc>(context);
    _topRateBloc..add(FetchMovieDetailEvent(movieId: id));
    movieDetailCast..add(FetchMovieDetailCastsEvent(movieId: id));
    videoTrailerBloc.add(FetchVideosEvent(movieId: id));
    reviewsBloc.add(FetchReviewsEvent(movieId: id));
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            builder: (context, state) {
          if (state is MovieDetailLoadingState) {
            return Center(
                child:
                    CircularProgressIndicator(backgroundColor: Colors.orange));
          }

          if (state is MovieDetailErrorState) {
            return Center(
              child: Text(
                "Error",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (state is MovieDetailLoadedState) {
            return Stack(children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 280,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:
                                "https://image.tmdb.org/t/p/original${state.movieDetail.backdropPath}",
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
                        Positioned(
                          bottom: 20,
                          left: 15,
                          child: Text(
                            "${state.movieDetail.title} ",
                            style: GoogleFonts.lato(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${state.movieDetail.originalTitle}",
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.yellow, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "${state.movieDetail.releaseDate} | ",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.white60),
                            ),
                          ),
                          Text(
                            "${state.movieDetail.runtime} mins | ",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.white60),
                            ),
                          ),
                          RatingBar(
                            ratingCount: state.movieDetail.voteAvg ~/ 2,
                          ),
                          Text(
                            " | ${state.movieDetail.voteAvg} rating",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.white60),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${state.movieDetail.overview}",
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.white60, height: 1.6),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          for (var item in state.movieDetail.genres)
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 15,
                              constraints: new BoxConstraints(
                                minWidth: 40.0,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "${item.name}",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<VideosBloc, VideosState>(
                              builder: (context, state) {
                            if (state is VideosLoadingState) {
                              Column(
                                children: [
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.grey,
                                  ),
                                  Text(
                                    "Trailer",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              );
                            }
                            if (state is VideosLoadedState) {
                              return Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  VideoTrailer(
                                                      youtubeKeys: state
                                                          .videosModel
                                                          .results)));
                                    },
                                    icon: Icon(
                                      Icons.video_library,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    "Trailer",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              );
                            }

                            if (state is VideosEmptyState) {
                              return Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.video_library,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    "No Trailer",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Text("hello world");
                          }),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "Share",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "My List",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "Rate",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.download_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "Download",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MovieDetailHeading(title: "Top Billed Casts"),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<MovieDetailCastsBloc, MovieDetailCastsState>(
                        builder: (context, state) {
                      if (state is MovieDetailCastsLoadingState) {
                        return LoadingRowCast();
                      }

                      if (state is MovieDetailCastsLoadedState) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 13),
                          height: 120,
                          width: double.infinity,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.movieDetailCastModel.casts.length,
                            itemBuilder: (BuildContext context, int index) {
                              var url = state.movieDetailCastModel.casts[index]
                                          .profilePath !=
                                      null
                                  ? "https://image.tmdb.org/t/p/original${state.movieDetailCastModel.casts[index].profilePath}"
                                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGyb4uoKEITC5H0mo3gEtXpr4tYRUt9Wz8vg&usqp=CAU";
                              return Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    margin: EdgeInsets.all(8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(200),
                                      child: CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        fit: BoxFit.fill,
                                        imageUrl: url,
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
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${state.movieDetailCastModel.casts[index].name}",
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ),
                                        Text(
                                          "${state.movieDetailCastModel.casts[index].character}",
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      }

                      return CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      );
                    }),
                    SizedBox(
                      height: 30,
                    ),
                    MovieDetailHeading(
                      title: "Info",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          InfoBar(
                            keyString: "Status",
                            valueString: state.movieDetail.status,
                            icon: Icons.info_outline,
                          ),
                          InfoBar(
                            keyString: "Budget",
                            valueString:
                                "\$ ${state.movieDetail.budget.toString()}",
                            icon: Icons.money,
                          ),
                          InfoBar(
                            keyString: "Languages",
                            languages: state.movieDetail.spokenLang,
                            icon: Icons.language,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MovieDetailHeading(title: "Similar Movies"),
                    SizedBox(
                      height: 20,
                    ),
                    SimilarMovieslist(
                      movieId: id,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MovieDetailHeading(title: "Reviews"),
                    SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<ReviewsBloc, ReviewsState>(
                      builder: (context, state) {
                        if (state is ReviewsLoadingState) {
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.yellow,
                          ));
                        }

                        if (state is ReviewsLoadedState) {
                          return ReviewList(
                            result: state.reviewsModel,
                          );
                        }

                        if (state is ReviewsEmptyState) {
                          return Center(
                            child: Text(
                              "No Reviews",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ]);
          }

          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        }));
  }
}
