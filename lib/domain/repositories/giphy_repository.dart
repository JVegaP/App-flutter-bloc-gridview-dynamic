import 'package:giphy_flutter_app/domain/entities/giphy_object_entity.dart';

abstract class GiphyRepository {

  Future<List<GiphyObjectEntity>> getListGiphy();

  Future<List<GiphyObjectEntity>> getListGiphyByName({
    required String search
  });

}