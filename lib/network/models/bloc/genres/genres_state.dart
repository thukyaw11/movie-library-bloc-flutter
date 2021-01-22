part of 'genres_bloc.dart';

abstract class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

class GenresInitial extends GenresState {}

class GenresLoadingState extends GenresState {}

class GenresLoadedState extends GenresState {
  final GenresModel genresModel;
  GenresLoadedState({this.genresModel});
}

class GenresErrorState extends GenresState {}
