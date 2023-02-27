import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../repository/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthUnautorized()) {
    on<AuthSignIn>(_onSignIn);
    on<AuthSignOut>(_onSignOut);
  }

  Future<void> _onSignIn(
    AuthSignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signIn(event.context);
      if (user != null) {
        emit(AuthAutorized(user));
      } else {
        emit(const AuthError(
          'Authorization error - no user',
        ));
      }
    } catch (e) {
      emit(AuthError(
        'Authorization error :${e.toString()}',
      ));
    }
  }

  Future<void> _onSignOut(
    AuthSignOut event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final isSignedOut = await _authRepository.signOut(event.context);
      if (isSignedOut == true) {
        emit(AuthUnautorized());
      } else {
        emit(const AuthError(
          'Unauthorization error',
        ));
      }
    } catch (e) {
      emit(AuthError(
        'Unauthorization error :${e.toString()}',
      ));
    }
  }
}
