import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/videos_model/videos_model.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  VideosBloc({this.api}) : super(VideosInitial());
  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";
  @override
  Stream<VideosState> mapEventToState(
    VideosEvent event,
  ) async* {
    if (event is FetchVideosEvent) {
      yield VideosLoadingState();

      try {
        final response = await api.getVideosList(event.movieId, apiKey);

        if (response.results.isEmpty) {
          yield VideosEmptyState();
        } else {
          yield VideosLoadedState(videosModel: response);
        }
      } on Exception {
        yield VideosErrorState();
      } on SocketException {
        yield VideosErrorState();
      }
    }
  }
}
