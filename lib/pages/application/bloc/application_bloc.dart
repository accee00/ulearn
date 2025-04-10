import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(AppState()) {
    on<UpdateIndexEvent>(
      (event, emit) {
        emit(AppState(index: event.index));
      },
    );
  }
}
