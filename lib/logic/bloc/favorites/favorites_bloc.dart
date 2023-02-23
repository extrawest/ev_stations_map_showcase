import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/utils.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoriteFireBaseAuthListen>(_onInitial);
    on<FavoritesRead>(_onRead);
    on<FavoritesWrite>(_onWrite);
    on<FavoritesClear>(_onClear);
  }

  Future<void> _onInitial(
    FavoriteFireBaseAuthListen event,
    Emitter<FavoritesState> emit,
  ) async {
    GoogleAuth.firebaseAuth.authStateChanges().listen((User? user) {
      if (GoogleAuth.firebaseUser == null) {
        log.fine('!------- User is currently signed out!');
        _onClear(null, emit);
      } else {
        log.fine('!------- User is signed in!');
        _onRead(null, emit);
      }
    });
  }

  Future<void> _onRead(
    FavoritesRead? event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favoriteIds = [
        ...prefs.getStringList('favoriteIds') ?? []
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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favoriteIds = [
        ...prefs.getStringList('favoriteIds') ?? []
      ];

      final stationId = event.stationId;
      final isFavorite = favoriteIds.contains(stationId);

      if (isFavorite) {
        favoriteIds.remove(stationId);
      } else {
        favoriteIds.add(stationId);
      }

      await prefs.setStringList('favoriteIds', favoriteIds);

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
    FavoritesClear? event,
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
