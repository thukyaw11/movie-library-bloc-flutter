import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/network/api_service.dart';
import 'package:movie_app/network/models/reviews_model/reviews_model.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc({this.api}) : super(ReviewsInitial());
  final ApiService api;
  String apiKey = "02d007f9d32d6fa8d67bf53d2a8bf8d9";
  @override
  Stream<ReviewsState> mapEventToState(
    ReviewsEvent event,
  ) async* {
    if (event is FetchReviewsEvent) {
      yield ReviewsLoadingState();
      try {
        final response = await api.getReviewsList(event.movieId, apiKey);

        if (response.results.isEmpty) {
          yield ReviewsEmptyState();
        } else {
          yield ReviewsLoadedState(reviewsModel: response);
        }
      } on Exception {
        yield ReviewsErrorState();
      } on SocketException {
        yield ReviewsErrorState();
      }
    }
  }
}
