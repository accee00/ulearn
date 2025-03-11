part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

class SignInUserState extends SigninState {
  final String email;
  final String password;

  SignInUserState({
    this.email = '',
    this.password = '',
  });
  SignInUserState copyWith({String? email, String? password}) {
    return SignInUserState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
