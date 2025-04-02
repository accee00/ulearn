// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterUserState extends RegisterState {
  final String name;
  final String email;
  final String password;
  final String rePassword;

  RegisterUserState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',
  });

  RegisterUserState copyWith({
    String? name,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterUserState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
