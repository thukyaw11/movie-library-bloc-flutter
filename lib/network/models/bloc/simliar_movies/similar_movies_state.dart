part of 'similar_movies_bloc.dart';

abstract class SimilarMoviesState extends Equatable {
  const SimilarMoviesState();

  @override
  List<Object> get props => [];
}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoadingState extends SimilarMoviesState {}

class SimilarMoviesLoadedState extends SimilarMoviesState {
  final MoviesModel similarMovies;
  SimilarMoviesLoadedState({this.similarMovies});
}

class SimilarMoviesEmptyState extends SimilarMoviesState {}

class SimilarMoviesErrorState extends SimilarMoviesState {}
