import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/movie_detail_model/movie_detail_model.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc({this.api}) : super(MovieDetailInitial());
  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is FetchMovieDetailEvent) {
      yield MovieDetailLoadingState();

      try {
        final response = await api.getMovieDetail(event.movieId, apiKey);
        yield MovieDetailLoadedState(movieDetail: response);
      } on Exception {
        yield MovieDetailErrorState();
        // ignore: dead_code_on_catch_subtype
      } on SocketException {
        yield MovieDetailErrorState();
      }
    }
  }
}
