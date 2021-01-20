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
  MoviesLoadedState(
      {@required this.movies,
      @required this.upComingMovies,
      @required this.popularMovies})
      : assert(movies != null);
}

class MoviesErrorState extends MoviesState {}
