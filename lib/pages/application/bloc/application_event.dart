part of 'application_bloc.dart';

@immutable
sealed class ApplicationEvent {}

class UpdateIndexEvent extends ApplicationEvent {
  final int index;
  UpdateIndexEvent(this.index);
}
