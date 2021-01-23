part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchDataLoadingState extends SearchState {}

class SearchDataLoadedState extends SearchState {
  final SearchModel searchResults;
  SearchDataLoadedState({this.searchResults});
}

class SearchDataErrorState extends SearchState {}
