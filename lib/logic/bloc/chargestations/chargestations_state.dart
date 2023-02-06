part of 'chargestations_bloc.dart';

@immutable
class ChargestationsState {}

class ChargestationsInitial extends ChargestationsState {}

class ChargestationsLoading extends ChargestationsState {}

class ChargestationsLoadedState extends ChargestationsState {
  final List<ChargestationsModel> chargestationsList;
  ChargestationsLoadedState(this.chargestationsList);
}

class ChargestationsError extends ChargestationsState {
  // Error e;
  final String? message;
  ChargestationsError(this.message);
  // ChargestationDetailsError(this.e);
}
