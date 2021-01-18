part of 'movies_bloc.dart';

abstract class MoviesEvent {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchMoviesEvent extends MoviesEvent {
  final String type;
  FetchMoviesEvent({@required this.type}) : assert(type != null);
}
