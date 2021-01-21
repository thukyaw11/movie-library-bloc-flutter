part of 'reviews_bloc.dart';

abstract class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

class FetchReviewsEvent extends ReviewsEvent {
  final int movieId;
  FetchReviewsEvent({this.movieId});
}
