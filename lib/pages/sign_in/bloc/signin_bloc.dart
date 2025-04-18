import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SignInUserState> {
  SigninBloc() : super(SignInUserState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  FutureOr<void> _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
    print(event.email);
  }

  FutureOr<void> _passwordEvent(
      PasswordEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
    print(event.password);
  }
}
