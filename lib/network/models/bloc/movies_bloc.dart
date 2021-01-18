import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/movies_model.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc({@required this.api}) : super(MoviesInitial());
  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";
  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is FetchMoviesEvent) {
      yield MoviesLoadingState();
      try {
        final responseTopRated = await api.getMovieList("top_rated", apiKey);
        final upComing = await api.getMovieList("upcoming", apiKey);
        final popularMovies = await api.getMovieList("popular", apiKey);

        yield MoviesLoadedState(
            movies: responseTopRated,
            upComingMovies: upComing,
            popularMovies: popularMovies);
      } on SocketException {
        yield MoviesErrorState();
      } on Exception {
        yield MoviesErrorState();
      }
    }
  }
}
