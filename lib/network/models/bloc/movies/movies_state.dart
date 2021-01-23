part of 'movies_bloc.dart';

abstract class MoviesState {
  const MoviesState();
  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class UpComingMoviesLoadingState extends MoviesState {}

class MoviesLoadedState extends MoviesState {
  final MoviesModel movies;
  final MoviesModel upComingMovies;
  final MoviesModel popularMovies;
  MoviesLoadedState({
    this.movies,
    this.upComingMovies,
    this.popularMovies,
  });
}

class MoviesErrorState extends MoviesState {}
