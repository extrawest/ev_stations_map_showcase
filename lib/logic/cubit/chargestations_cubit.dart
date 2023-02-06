import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chargestations_model.dart';
import '../../services/api_service.dart';
import '../../utils/logger.dart';

part 'chargestations_state.dart';

class ChargestationsCubit extends Cubit<ChargestationsState> {
  final ApiService apiService;

  ChargestationsCubit({required this.apiService})
      : super(ChargestationsInitial()) {
    fetchChargestations(apiService);
  }

  Future<List<ChargestationsModel>> fetchChargestations(
      ApiService apiService) async {
    try {
      final response = await apiService.fetchChargestations();

      log.fine('--->Response: $response');
      emitChargestations(response);

      return response;
    } catch (e) {
      log.severe('chargestationsData error: $e');
      rethrow;
    }
  }

  void emitChargestations(List<ChargestationsModel> stationslist) =>
      emit(ChargestationsLoaded(stationslist: stationslist));
}
