import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';
part 'splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(): super(const SplashInitialState()) {
    on<UpdateLoadingEvent>((event, emit) {
      emit(state.copyWith(
        isLoading: event.loading
      ));
    });
  }

  bool get isLoading {
    return state.isLoading;
  }

  set isLoading(bool value) {
    add(UpdateLoadingEvent(value));
  }

}