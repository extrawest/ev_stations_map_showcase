part of 'routing_bloc.dart';

abstract class RoutingState extends Equatable {
  const RoutingState();

  @override
  List<Object> get props => [];
}

class RoutingInitial extends RoutingState {}

class RoutingLoaded extends RoutingState {
  final int pageIndex;
  const RoutingLoaded({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}

class RoutingLoading extends RoutingState {}

class RoutingError extends RoutingState {
  final String error;
  const RoutingError(this.error);

  @override
  List<Object> get props => [error];
}
