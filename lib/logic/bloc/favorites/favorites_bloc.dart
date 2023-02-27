import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/repositories.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final StorageRepository storageRepository;
  FavoritesBloc({required this.storageRepository}) : super(FavoritesInitial()) {
    on<FavoritesRead>(_onRead);
    on<FavoritesWrite>(_onWrite);
    on<FavoritesClear>(_onClear);
  }

  Future<void> _onRead(
    FavoritesRead event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final List<String> favoriteIds =
          await storageRepository.readFavoriteIdsList('favoriteIds');
      emit(FavoritesLoaded(favoriteIds));
    } catch (e) {
      emit(FavoritesError(
        'Favorite read error :${e.toString()}',
      ));
    }
  }

  Future<void> _onWrite(
    FavoritesWrite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final List<String> favoriteIds =
          await storageRepository.readFavoriteIdsList('favoriteIds');

      final stationId = event.stationId;
      final isFavorite = favoriteIds.contains(stationId);

      if (isFavorite) {
        favoriteIds.remove(stationId);
      } else {
        favoriteIds.add(stationId);
      }

      await storageRepository.writeFavoriteIdsList('favoriteIds', favoriteIds);

      emit(FavoritesLoaded(favoriteIds));
    } catch (e) {
      emit(
        FavoritesError(
          'Favorite write error :${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onClear(
    FavoritesClear event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      emit(const FavoritesLoaded([]));
    } catch (e) {
      emit(
        FavoritesError(
          'Favorite clear error :${e.toString()}',
        ),
      );
    }
  }
}
