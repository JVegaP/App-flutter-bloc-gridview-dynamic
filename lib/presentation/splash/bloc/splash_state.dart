part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final bool isLoading;

  const SplashState({
   this.isLoading = true
  });

  SplashState copyWith({
    bool? isLoading
  }) => SplashState(isLoading: isLoading ?? this.isLoading);

  @override
  List<Object?> get props => [isLoading];
}

class SplashInitialState extends SplashState {
  const SplashInitialState(): super();
}

/// Class to update the loading of the screen
class UpdateLoadingState extends SplashState {
  final bool loading;
  const UpdateLoadingState(this.loading) : super(isLoading: loading);
}