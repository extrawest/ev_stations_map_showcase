part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String error;
  const AuthError(this.error);

  @override
  List<Object> get props => [error];
}

class AuthAutorized extends AuthState {
  final User user;
  const AuthAutorized(this.user);

  @override
  List<Object> get props => [user];
}

class AuthUnautorized extends AuthState {}
