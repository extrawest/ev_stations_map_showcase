import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routing_event.dart';
part 'routing_state.dart';

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  RoutingBloc() : super(RoutingInitial()) {
    on<RoutingTransition>(_onTransition);
  }

  void _onTransition(
    RoutingEvent event,
    Emitter<RoutingState> emit,
  ) {
    try {
      final pageIndex = (event as RoutingTransition).pageIndex;
      emit(RoutingLoaded(pageIndex: pageIndex));
    } catch (e) {
      emit(RoutingError(
        'Transition to map error :${e.toString()}',
      ));
    }
  }
}
