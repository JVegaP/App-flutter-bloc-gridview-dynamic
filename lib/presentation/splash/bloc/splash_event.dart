part of 'splash_bloc.dart';

abstract class SplashEvent {}

class UpdateLoadingEvent extends SplashEvent {
  final bool loading;
  UpdateLoadingEvent(this.loading);
}