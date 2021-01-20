part of 'movie_detail_casts_bloc.dart';

abstract class MovieDetailCastsState extends Equatable {
  const MovieDetailCastsState();

  @override
  List<Object> get props => [];
}

class MovieDetailCastsInitial extends MovieDetailCastsState {}

class MovieDetailCastsLoadingState extends MovieDetailCastsState {}

class MovieDetailCastsLoadedState extends MovieDetailCastsState {
  final MoviesDetailCastModel movieDetailCastModel;
  MovieDetailCastsLoadedState({this.movieDetailCastModel});
}

class MovieDetailCastsErrorState extends MovieDetailCastsState {}
