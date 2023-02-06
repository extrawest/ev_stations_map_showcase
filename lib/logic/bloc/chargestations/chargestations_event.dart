part of 'chargestations_bloc.dart';

@immutable
abstract class ChargestationsEvent {
  const ChargestationsEvent();
}

class FetchChargestationsEvent extends ChargestationsEvent {
  const FetchChargestationsEvent();
}
