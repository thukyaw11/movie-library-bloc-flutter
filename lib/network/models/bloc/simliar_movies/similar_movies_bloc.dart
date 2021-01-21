import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/movie_model/movies_model.dart';

part 'similar_movies_event.dart';
part 'similar_movies_state.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {
  SimilarMoviesBloc({this.api}) : super(SimilarMoviesInitial());

  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";

  @override
  Stream<SimilarMoviesState> mapEventToState(
    SimilarMoviesEvent event,
  ) async* {
    if (event is FetchSimilarMoviesEvent) {
      yield SimilarMoviesLoadingState();

      try {
        final response = await api.getSimilarMoviesList(event.movieId, apiKey);

        if (response.movie.isEmpty) {
          yield SimilarMoviesEmptyState();
        } else {
          yield SimilarMoviesLoadedState(similarMovies: response);
        }
      } on Exception {
        yield SimilarMoviesErrorState();
      } on SocketException {
        yield SimilarMoviesErrorState();
      }
    }
  }
}
