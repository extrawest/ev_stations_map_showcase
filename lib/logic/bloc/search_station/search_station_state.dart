part of 'search_station_bloc.dart';

abstract class SearchStationState extends Equatable {
  const SearchStationState();

  @override
  List<Object> get props => [];
}

class SearchStationInitial extends SearchStationState {}

class SearchStationFound extends SearchStationState {
  final List<ChargestationsModel> foundStations;

  const SearchStationFound({required this.foundStations});

  @override
  List<Object> get props => [foundStations];
}

class SearchStationError extends SearchStationState {
  final String error;
  const SearchStationError(this.error);

  @override
  List<Object> get props => [error];
}

class SearchStationLoading extends SearchStationState {}
