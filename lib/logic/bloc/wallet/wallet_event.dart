part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();
}

class WalletStarted extends WalletEvent {
  @override
  List<Object> get props => [];
}
