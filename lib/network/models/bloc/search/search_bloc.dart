import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/search_model/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({this.api}) : super(SearchInitial());

  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is FetchSearchInitialEvent) {
      yield SearchInitial();
    }
    if (event is FetchSearchDataEvent) {
      yield SearchDataLoadingState();
      try {
        final searchData = await api.getMovieByGenre(1, apiKey, event.genreId);
        yield SearchDataLoadedState(searchResults: searchData);
      } on Exception {
        yield SearchDataErrorState();
      } on SocketException {
        yield SearchDataErrorState();
      }
    }

    if (event is FetchSearchDataEventByQuery) {
      yield SearchDataLoadingState();

      try {
        final searchWithQuery =
            await api.getMovieByQuery(1, event.query, apiKey);
        yield SearchDataLoadedState(searchResults: searchWithQuery);
      } on Exception {
        yield SearchDataErrorState();
      } on SocketException {
        yield SearchDataErrorState();
      }
    }
  }
}
