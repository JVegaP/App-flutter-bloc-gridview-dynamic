import 'package:giphy_flutter_app/core/constants/api_constants.dart';
import 'package:giphy_flutter_app/data/datasource/remote/giphy_remote_data_source.dart';
import 'package:giphy_flutter_app/domain/entities/base_response_entity.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_object_entity.dart';
import 'package:giphy_flutter_app/domain/repositories/giphy_repository.dart';

class IGiphyRepository extends GiphyRepository {

  final GiphyRemoteDataSource _giphyRemoteDataSource;

  IGiphyRepository({
    GiphyRemoteDataSource? giphyRemoteDataSource
  }): _giphyRemoteDataSource = giphyRemoteDataSource ?? IGiphyRemoteDataSource();


  ///--------------------------------- PUBLIC METHODS ---------------------------------

  /// Method that return data of list of giphy
  @override
  Future<List<GiphyObjectEntity>> getListGiphy() async{
    final BaseResponseEntity? response = await _giphyRemoteDataSource.getListGiphy();
    if(response != null) {
      if(response.meta.status == kApiCodeSuccess) {
          return response.data ?? [];
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  /// Method that return data of list of giphy by name
  @override
  Future<List<GiphyObjectEntity>> getListGiphyByName({
    required String search
  }) async{
    final BaseResponseEntity? response = await _giphyRemoteDataSource.getListGiphyByName(search: search);
    if(response != null) {
      if(response.meta.status == kApiCodeSuccess) {
        return response.data ?? [];
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}