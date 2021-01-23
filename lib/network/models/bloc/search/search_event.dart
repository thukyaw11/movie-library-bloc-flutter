part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchDataEvent extends SearchEvent {
  final int genreId;

  FetchSearchDataEvent({this.genreId});
}

class FetchSearchDataEventByQuery extends SearchEvent {
  final String query;
  FetchSearchDataEventByQuery({this.query});
}

class FetchSearchInitialEvent extends SearchEvent {}
