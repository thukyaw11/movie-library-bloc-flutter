import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/movie_detail_cast_model/movies_detail_cast_model.dart';

part 'movie_detail_casts_event.dart';
part 'movie_detail_casts_state.dart';

class MovieDetailCastsBloc
    extends Bloc<MovieDetailCastsEvent, MovieDetailCastsState> {
  MovieDetailCastsBloc({this.api}) : super(MovieDetailCastsInitial());
  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";
  @override
  Stream<MovieDetailCastsState> mapEventToState(
    MovieDetailCastsEvent event,
  ) async* {
    if (event is FetchMovieDetailCastsEvent) {
      try {
        yield MovieDetailCastsLoadingState();
        print("before fetching");
        final response =
            await api.getCastFromMovieDetail(event.movieId, apiKey);
        yield MovieDetailCastsLoadedState(movieDetailCastModel: response);
        print("fetched");
      } on Exception {
        yield MovieDetailCastsErrorState();
      } on SocketException {
        yield MovieDetailCastsErrorState();
      }
    }
  }
}
