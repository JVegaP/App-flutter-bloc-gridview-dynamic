part of 'home_bloc.dart';

abstract class HomeEvent {}

class UpdateLoadingEvent extends HomeEvent {
  final bool loading;
  UpdateLoadingEvent(this.loading);
}

class LoadGiphyEvent extends HomeEvent {
  final List<GiphyObjectEntity> listItems;
  LoadGiphyEvent(this.listItems);
}