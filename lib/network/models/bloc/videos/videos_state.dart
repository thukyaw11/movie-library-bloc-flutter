part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object> get props => [];
}

class VideosInitial extends VideosState {}

class VideosLoadingState extends VideosState {}

class VideosLoadedState extends VideosState {
  final VideosModel videosModel;
  VideosLoadedState({this.videosModel});
}

class VideosErrorState extends VideosState {}

class VideosEmptyState extends VideosState {}
