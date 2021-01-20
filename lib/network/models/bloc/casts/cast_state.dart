part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoadingState extends CastState {}

class CastLoadedState extends CastState {
  final CastsModel castList;
  CastLoadedState({this.castList});
}

class CastErrorState extends CastState {}
