part of 'chargestations_cubit.dart';

@immutable
abstract class ChargestationsState {}

class ChargestationsLoading extends ChargestationsState {}

class ChargestationsLoaded extends ChargestationsState {
  final List<ChargestationsModel> stationslist;

  ChargestationsLoaded({required this.stationslist});
}

class ChargestationsInitial extends ChargestationsState {}
