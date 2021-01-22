import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/genres_model/genres_model.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  GenresBloc({this.api}) : super(GenresInitial());
  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";
  @override
  Stream<GenresState> mapEventToState(
    GenresEvent event,
  ) async* {
    if (event is FetchGenresEvent) {
      yield GenresLoadingState();
      try {
        final response = await api.getGenreList(apiKey);
        yield GenresLoadedState(genresModel: response);
      } on Exception {
        yield GenresLoadingState();
      } on SocketException {
        yield GenresLoadingState();
      }
    }
  }
}
