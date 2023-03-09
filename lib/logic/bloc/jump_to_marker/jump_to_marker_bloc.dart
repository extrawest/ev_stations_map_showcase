import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'jump_to_marker_event.dart';
part 'jump_to_marker_state.dart';

class JumpToMarkerBloc extends Bloc<JumpToMarkerEvent, JumpToMarkerState> {
  JumpToMarkerBloc() : super(JumpToMarkerInitial()) {
    on<JumpToMarkerWithCoordinates>(_onJumpTo);
  }

  Future<void> _onJumpTo(JumpToMarkerWithCoordinates event,
      Emitter<JumpToMarkerState> emit) async {
    emit(JumpToMarkerLoading());
    try {
      final LatLng position = event.position;
      emit(JumpToMarkerLoaded(position));
    } catch (error) {
      emit(JumpToMarkerError(
        'Move Camera to position error :${error.toString()}',
      ));
    }
  }
}
