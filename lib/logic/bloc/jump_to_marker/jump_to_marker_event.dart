part of 'jump_to_marker_bloc.dart';

abstract class JumpToMarkerEvent extends Equatable {
  const JumpToMarkerEvent();
}

class JumpToMarkerWithCoordinates extends JumpToMarkerEvent {
  final LatLng position;

  const JumpToMarkerWithCoordinates(this.position);

  @override
  List<Object> get props => [];
}
