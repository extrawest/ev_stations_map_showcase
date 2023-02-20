part of 'search_station_bloc.dart';

@freezed
// class SearchStationEvent with _$SearchStationEvent {
//   factory SearchStationEvent.findItem({
//     required String searchString,
//     required List<ChargestationsModel> stations,
//   }) = _FindItemSearchStationEvent;
// }

abstract class SearchStationEvent extends Equatable {
  const SearchStationEvent();
}

class SearchStationFindItem extends SearchStationEvent {
  final String searchString;
  final List<ChargestationsModel> stations;

  const SearchStationFindItem(
      {required this.stations, required this.searchString});
  @override
  List<Object> get props => [];
}
