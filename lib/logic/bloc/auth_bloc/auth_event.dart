part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthSignIn extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthSignOut extends AuthEvent {
  @override
  List<Object> get props => [];
}
