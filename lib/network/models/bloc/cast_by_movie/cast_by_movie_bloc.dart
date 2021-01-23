import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/movie_by_cast_model/movies_by_cast_model.dart';

part 'cast_by_movie_event.dart';
part 'cast_by_movie_state.dart';

class CastByMovieBloc extends Bloc<CastByMovieEvent, CastByMovieState> {
  CastByMovieBloc({this.api}) : super(CastByMovieInitial());
  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";

  @override
  Stream<CastByMovieState> mapEventToState(
    CastByMovieEvent event,
  ) async* {
    if (event is FetchMovieByCastEvent) {
      print("fetching data");
      try {
        yield CastByMovieLoadingState();
        final response = await api.getMovieByCast(event.personId, apiKey);
        yield CastByMovieLoadedState(moviesByCastModel: response);
      } on Exception {
        yield CastByMovieErrorState();
      } on SocketException {
        yield CastByMovieErrorState();
      }
    }
  }
}
