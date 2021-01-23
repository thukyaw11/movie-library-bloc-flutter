part of 'cast_by_movie_bloc.dart';

abstract class CastByMovieState extends Equatable {
  const CastByMovieState();

  @override
  List<Object> get props => [];
}

class CastByMovieInitial extends CastByMovieState {}

class CastByMovieLoadingState extends CastByMovieState {}

class CastByMovieLoadedState extends CastByMovieState {
  final MoviesByCastModel moviesByCastModel;
  CastByMovieLoadedState({this.moviesByCastModel});
}

class CastByMovieErrorState extends CastByMovieState {}
