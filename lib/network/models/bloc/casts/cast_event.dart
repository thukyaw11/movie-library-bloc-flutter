part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object> get props => [];
}

class FetchCastEvent extends CastEvent {
  final int pageId;
  FetchCastEvent({this.pageId});
}
