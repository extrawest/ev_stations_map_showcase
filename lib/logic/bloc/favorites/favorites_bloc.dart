import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../repository/repositories.dart';
import '../../../utils/utils.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final StorageRepository storageRepository = StorageRepositoryImpl();
  FavoritesBloc() : super(FavoritesInitial()) {
    // on<FavoriteFireBaseAuthListen>(_onInitial);
    on<FavoritesRead>(_onRead);
    on<FavoritesWrite>(_onWrite);
    on<FavoritesClear>(_onClear);

    GoogleAuth.firebaseAuth.authStateChanges().listen((User? user) {
      if (GoogleAuth.firebaseUser == null) {
        log.fine('!------- User is currently signed out!');
        FavoritesClear();
      } else {
        log.fine('!------- User is signed in!');
        FavoritesRead();
      }
    });
  }

  Future<void> _onRead(
    FavoritesRead event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final List<String> favoriteIds = [
        ...await storageRepository.readList('favoriteIds')
      ];
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
      final List<String> favoriteIds = [
        ...await storageRepository.readList('favoriteIds')
      ];

      final stationId = event.stationId;
      final isFavorite = favoriteIds.contains(stationId);

      if (isFavorite) {
        favoriteIds.remove(stationId);
      } else {
        favoriteIds.add(stationId);
      }

      await storageRepository.writeList('favoriteIds', favoriteIds);

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
