part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<GiphyObjectEntity>? listItems;

  const HomeState({
    this.isLoading = true,
    this.listItems
  });

  HomeState copyWith({
    bool? isLoading,
    List<GiphyObjectEntity>? listItems
  }) => HomeState(
      isLoading: isLoading ?? this.isLoading,
      listItems: listItems ?? this.listItems
  );

  @override
  List<Object?> get props => [isLoading, listItems];
}

class HomeInitialState extends HomeState {
  const HomeInitialState(): super();
}

/// Class to update the loading of the screen
class UpdateLoadingState extends HomeState {
  final bool loading;
  const UpdateLoadingState(this.loading) : super(isLoading: loading);
}

/// Class to load data to list giphy
class LoadGiphyState extends HomeState {
  final List<GiphyObjectEntity> items;
  const LoadGiphyState(this.items) : super(listItems: items);
}