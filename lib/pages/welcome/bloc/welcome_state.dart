part of 'welcome_bloc.dart';

sealed class WelcomeState {}

class WelcomePageState extends WelcomeState {
  int pageIndex;
  WelcomePageState({this.pageIndex = 0});
}
