import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/models.dart';

import '../../../services/api_service.dart';

part 'chargestations_event.dart';
part 'chargestations_state.dart';

class ChargestationsBloc
    extends Bloc<ChargestationsEvent, ChargestationsState> {
  ChargestationsBloc({required this.apiService})
      : super(ChargestationsLoading()) {
    on<ChargestationsStarted>(_onStarted);
  }

  final ApiService apiService;

  Future<void> _onStarted(
    ChargestationsStarted event,
    Emitter<ChargestationsState> emit,
  ) async {
    emit(ChargestationsLoading());
    try {
      final stationsList = await apiService.fetchChargestations();
      emit(ChargestationsLoaded(stationsList));
    } catch (e) {
      emit(ChargestationsError(
        'Get chargestation list error :${e.toString()}',
      ));
    }
  }
}
