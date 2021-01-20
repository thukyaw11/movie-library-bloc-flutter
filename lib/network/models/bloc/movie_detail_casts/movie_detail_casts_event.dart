part of 'movie_detail_casts_bloc.dart';

abstract class MovieDetailCastsEvent extends Equatable {
  const MovieDetailCastsEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDetailCastsEvent extends MovieDetailCastsEvent {
  final int movieId;
  FetchMovieDetailCastsEvent({this.movieId});
}
