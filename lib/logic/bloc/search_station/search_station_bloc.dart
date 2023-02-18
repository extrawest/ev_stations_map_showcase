import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/models.dart';

part 'search_station_event.dart';
part 'search_station_state.dart';
part 'search_station_bloc.freezed.dart';

class SearchStationBloc extends Bloc<SearchStationEvent, SearchStationState> {
  SearchStationBloc() : super(_SearchStationStateInitial()) {
    on<_FindItemSearchStationEvent>(_onFindItem);
  }

  Future<void> _onFindItem(
    _FindItemSearchStationEvent event,
    Emitter<SearchStationState> emit,
  ) async {
    List<String> result = [];
    emit(SearchStationState.loading());
    final String searchString = event.searchString;
  }
}
