part of 'chargestations_bloc.dart';

abstract class ChargestationsEvent extends Equatable {
  const ChargestationsEvent();
}

class ChargestationsStarted extends ChargestationsEvent {
  @override
  List<Object> get props => [];
}
