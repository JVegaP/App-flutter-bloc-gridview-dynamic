import 'package:giphy_flutter_app/data/repositories/giphy_repository_imp.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_object_entity.dart';
import 'package:giphy_flutter_app/domain/repositories/giphy_repository.dart';

class GetGiphyUseCase {
  final GiphyRepository _giphyRepository;

  GetGiphyUseCase({
    GiphyRepository? giphyRepository
  }): _giphyRepository = giphyRepository ?? IGiphyRepository();

  /// Method that search giphy for show in screen
  Future<List<GiphyObjectEntity>> invoke() async {
    final List<GiphyObjectEntity> result = await _giphyRepository.getListGiphy();
    return result;
  }
}