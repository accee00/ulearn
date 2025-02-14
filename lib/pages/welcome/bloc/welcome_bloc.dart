import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomePageState> {
  WelcomeBloc() : super(WelcomePageState()) {
    on<WelEvent>((event, emit) {
      emit(WelcomePageState(pageIndex: state.pageIndex));
    });
  }
}
