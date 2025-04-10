import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterUserState()) {
    on<UserNameEvent>(_userName);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passEvent);
    on<RePasswordEvent>(_rePassEvent);
  }
  // Updated event handlers in register_bloc.dart
  void _userName(UserNameEvent event, Emitter<RegisterState> emit) {
    emit((state as RegisterUserState)
        .copyWith(name: event.userName)); // Add cast
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit((state as RegisterUserState).copyWith(email: event.email));
  }

  void _passEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit((state as RegisterUserState).copyWith(password: event.password));
  }

  void _rePassEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    emit((state as RegisterUserState).copyWith(rePassword: event.repassword));
  }
}
