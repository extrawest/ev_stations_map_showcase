part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {
  const WalletLoaded(this.stationslist);

  final List<WalletModel> stationslist;

  @override
  List<Object> get props => [stationslist];
}

class ChargestationsError extends WalletState {}
