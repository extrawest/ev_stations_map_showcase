// part of 'search_station_bloc.dart';

// @freezed
// abstract class SearchStationState with _$SearchStationState {
//   const factory SearchStationState.initial() = _SearchStationStateInitial;
//   const factory SearchStationState.found(
//           {required List<ChargestationsModel> foundStations}) =
//       _SearchStationStateFound;
//   const factory SearchStationState.error({required String error}) =
//       _SearchStationStateError;
//   const factory SearchStationState.loading() = _SearchStationStateLoading;
// }

part of 'search_station_bloc.dart';

@freezed
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

class SearchStationError extends SearchStationState {}

class SearchStationLoading extends SearchStationState {}
