import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    on<UserNameEvent>(_userName);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passEvent);
    on<RePasswordEvent>(_rePassEvent);
  }
  void _userName(UserNameEvent event, Emitter<RegisterState> emit) {
    print(event.userName);
    emit(RegisterUserState().copyWith(name: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    print(event.email);
    emit(RegisterUserState().copyWith(email: event.email));
  }

  void _passEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    print(event.password);
    emit(RegisterUserState().copyWith(password: event.password));
  }

  void _rePassEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    print(event.repassword);
    emit(RegisterUserState().copyWith(rePassword: event.repassword));
  }
}
