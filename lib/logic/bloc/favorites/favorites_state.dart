part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<String> favoriteIds;
  const FavoritesLoaded(this.favoriteIds);

  @override
  List<Object> get props => [favoriteIds];
}

class FavoritesError extends FavoritesState {
  final String error;
  const FavoritesError(this.error);

  @override
  List<Object> get props => [error];
}
