part of 'welcome_bloc.dart';

@immutable
sealed class WelcomeState {}

class WelcomePageState extends WelcomeState {
  int pageIndex;
  WelcomePageState({this.pageIndex = 0});
}
