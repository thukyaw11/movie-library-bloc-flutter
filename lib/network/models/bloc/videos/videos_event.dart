part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object> get props => [];
}

class FetchVideosEvent extends VideosEvent {
  final int movieId;
  FetchVideosEvent({this.movieId});
}
