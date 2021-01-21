part of 'similar_movies_bloc.dart';

abstract class SimilarMoviesEvent extends Equatable {
  const SimilarMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchSimilarMoviesEvent extends SimilarMoviesEvent {
  final int movieId;
  FetchSimilarMoviesEvent({this.movieId});
}
