part of 'movies_bloc.dart';

abstract class MoviesEvent {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchMoviesEvent extends MoviesEvent {
  final String type;
  final int pageId;
  FetchMoviesEvent({@required this.type, @required this.pageId})
      : assert(type != null);
}
