part of 'jump_to_marker_bloc.dart';

abstract class JumpToMarkerState extends Equatable {
  const JumpToMarkerState();

  @override
  List<Object> get props => [];
}

class JumpToMarkerInitial extends JumpToMarkerState {}

class JumpToMarkerLoading extends JumpToMarkerState {}

class JumpToMarkerLoaded extends JumpToMarkerState {
  final LatLng position;
  const JumpToMarkerLoaded(this.position);

  @override
  List<Object> get props => [position];
}

class JumpToMarkerError extends JumpToMarkerState {
  final String error;
  const JumpToMarkerError(this.error);

  @override
  List<Object> get props => [error];
}
