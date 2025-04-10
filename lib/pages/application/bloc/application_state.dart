part of 'application_bloc.dart';

@immutable
sealed class ApplicationState {}

class AppState extends ApplicationState {
  final int index;
  AppState({this.index = 0});
}
