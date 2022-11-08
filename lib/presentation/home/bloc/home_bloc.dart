import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_object_entity.dart';
import 'package:giphy_flutter_app/domain/use_cases/get_giphy_by_name_use_case.dart';
import 'package:giphy_flutter_app/domain/use_cases/get_giphy_use_case.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGiphyUseCase _getGiphyUseCase;
  final GetGiphyByNameUseCase _getGiphyByNameUseCase;

  HomeBloc({
    GetGiphyUseCase? getGiphyUseCase,
    GetGiphyByNameUseCase? getGiphyByNameUseCase
}):
        _getGiphyUseCase = getGiphyUseCase ?? GetGiphyUseCase(),
        _getGiphyByNameUseCase = getGiphyByNameUseCase ?? GetGiphyByNameUseCase(),
        super(const HomeInitialState()) {
    on<UpdateLoadingEvent>((event, emit) {
      emit(state.copyWith(
          isLoading: event.loading
      ));
    });

    on<LoadGiphyEvent>((event, emit) {
      emit(state.copyWith(
          listItems: event.listItems
      ));
    });
  }

  bool get isLoading {
    return state.isLoading;
  }

  List<GiphyObjectEntity> get items {
    return state.listItems ?? [];
  }

  set isLoading(bool value) {
    add(UpdateLoadingEvent(value));
  }

  set items(List<GiphyObjectEntity> value) {
    add(LoadGiphyEvent(value));
  }

  /// Method that list giphy
  Future getListGiphy() async {
    var response = await _getGiphyUseCase.invoke();
    items = response;
  }

  /// Method that list giphy by name
  Future getListGiphyByName({required String search}) async {
    var response = await _getGiphyByNameUseCase.invoke(search: search);
    items = response;
  }
}