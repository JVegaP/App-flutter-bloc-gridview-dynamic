
import 'package:giphy_flutter_app/data/repositories/giphy_repository_imp.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_object_entity.dart';
import 'package:giphy_flutter_app/domain/repositories/giphy_repository.dart';

class GetGiphyByNameUseCase {
  final GiphyRepository _giphyRepository;

  GetGiphyByNameUseCase({
    GiphyRepository? giphyRepository
  }): _giphyRepository = giphyRepository ?? IGiphyRepository();

  /// Method that search giphy by name for show in screen
  Future<List<GiphyObjectEntity>> invoke({required String search}) async {
    final List<GiphyObjectEntity> result = await _giphyRepository.getListGiphyByName(search: search);
    return result;
  }
}