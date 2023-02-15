part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {
  const WalletLoaded(this.walletData);

  final WalletModel walletData;

  @override
  List<Object> get props => [walletData];
}

class WalletError extends WalletState {}
