part of 'chargestations_bloc.dart';

abstract class ChargestationsState extends Equatable {
  const ChargestationsState();

  @override
  List<Object> get props => [];
}

class ChargestationsInitial extends ChargestationsState {}

class ChargestationsLoading extends ChargestationsState {}

class ChargestationsLoaded extends ChargestationsState {
  const ChargestationsLoaded(this.stationslist);

  final List<ChargestationsModel> stationslist;

  @override
  List<Object> get props => [stationslist];
}

class ChargestationsError extends ChargestationsState {
  final String error;
  const ChargestationsError(this.error);

  @override
  List<Object> get props => [error];
}
