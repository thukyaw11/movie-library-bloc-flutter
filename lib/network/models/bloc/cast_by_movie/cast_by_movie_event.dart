part of 'cast_by_movie_bloc.dart';

abstract class CastByMovieEvent extends Equatable {
  const CastByMovieEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieByCastEvent extends CastByMovieEvent {
  final int personId;
  FetchMovieByCastEvent({this.personId});
}
