import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/models.dart';

part 'search_station_event.dart';
part 'search_station_state.dart';

class SearchStationBloc extends Bloc<SearchStationEvent, SearchStationState> {
  SearchStationBloc() : super(SearchStationInitial()) {
    on<SearchStationEvent>(_onFindItem);
  }

  Future<void> _onFindItem(
    SearchStationEvent event,
    Emitter<SearchStationState> emit,
  ) async {
    List<ChargestationsModel> result = [];
    emit(SearchStationLoading());
    try {
      final searchString = (event as SearchStationFindItem).searchString;
      result = [
        ...event.stations
            .where((element) => element.stationId.contains(searchString))
      ];
      emit(SearchStationFound(foundStations: result));
    } catch (e) {
      emit(SearchStationError(/*error: e.toString()*/));
    }
  }
}
