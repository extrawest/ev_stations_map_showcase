part of 'routing_bloc.dart';

abstract class RoutingEvent extends Equatable {
  const RoutingEvent();
}

class RoutingTransition extends RoutingEvent {
  final int pageIndex;

  const RoutingTransition({required this.pageIndex});

  @override
  List<Object> get props => [];
}
