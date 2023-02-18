part of 'search_station_bloc.dart';

@freezed
class SearchStationState with _$SearchStationState {
  const factory SearchStationState.initial() = _SearchStationStateInitial;
  const factory SearchStationState.found(
          {required List<ChargestationsModel> foundStations}) =
      _SearchStationStateFound;
  const factory SearchStationState.error({required String error}) =
      _SearchStationStateError;
  const factory SearchStationState.loading() = _SearchStationStateLoading;
}
