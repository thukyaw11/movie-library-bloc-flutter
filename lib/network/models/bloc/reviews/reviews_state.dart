part of 'reviews_bloc.dart';

abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoadingState extends ReviewsState {}

class ReviewsLoadedState extends ReviewsState {
  final ReviewsModel reviewsModel;
  ReviewsLoadedState({this.reviewsModel});
}

class ReviewsErrorState extends ReviewsState {}

class ReviewsEmptyState extends ReviewsState {}
