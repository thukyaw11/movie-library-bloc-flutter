import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/cast_model/casts_model.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc({this.api}) : super(CastInitial());
  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";

  @override
  Stream<CastState> mapEventToState(
    CastEvent event,
  ) async* {
    if (event is FetchCastEvent) {
      yield CastLoadingState();

      try {
        final castResponse = await api.getCastList(event.pageId, apiKey);
        yield CastLoadedState(castList: castResponse);
      } on SocketException {
        yield CastErrorState();
      } on Exception {
        yield CastErrorState();
      }
    }
  }
}
