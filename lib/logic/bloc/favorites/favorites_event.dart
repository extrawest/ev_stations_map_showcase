part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class FavoritesRead extends FavoritesEvent {
  @override
  List<Object> get props => [];
}

class FavoritesWrite extends FavoritesEvent {
  final String stationId;

  const FavoritesWrite({required this.stationId});
  @override
  List<Object> get props => [];
}

class FavoritesClear extends FavoritesEvent {
  @override
  List<Object> get props => [];
}

class FavoriteFireBaseAuthListen extends FavoritesEvent {
  @override
  List<Object> get props => [];
}
