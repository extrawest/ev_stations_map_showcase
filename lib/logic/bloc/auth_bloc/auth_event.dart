part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthSignIn extends AuthEvent {
  final BuildContext context;

  const AuthSignIn({required this.context});

  @override
  List<Object> get props => [];
}

class AuthSignOut extends AuthEvent {
  final BuildContext context;

  const AuthSignOut({required this.context});

  @override
  List<Object> get props => [];
}
