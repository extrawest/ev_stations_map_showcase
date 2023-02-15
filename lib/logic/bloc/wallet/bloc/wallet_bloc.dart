import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/models.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';
// part 'wallet_bloc.freezed.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletLoading()) {
    on<WalletEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
