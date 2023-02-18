part of 'search_station_bloc.dart';

@freezed
class SearchStationEvent with _$SearchStationEvent {
  factory SearchStationEvent.findItem({
    required String searchString,
    required List<ChargestationsModel> stations,
  }) = _FindItemSearchStationEvent;
}
