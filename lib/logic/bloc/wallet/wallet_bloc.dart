import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/models.dart';
import '../../../services/api_service.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc({required this.apiService}) : super(WalletLoading()) {
    on<WalletStarted>(_onStarted);
  }

  final ApiService apiService;

  Future<void> _onStarted(
    WalletStarted event,
    Emitter<WalletState> emit,
  ) async {
    emit(WalletLoading());
    try {
      final walletData = await apiService.fetchWalletData();
      emit(WalletLoaded(walletData));
    } catch (e) {
      emit(WalletError(
        'Get wallt information error :${e.toString()}',
      ));
    }
  }
}
