part of 'search_station_bloc.dart';

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

class SearchStationClearSearch extends SearchStationEvent {
  const SearchStationClearSearch();
  @override
  List<Object> get props => [];
}
