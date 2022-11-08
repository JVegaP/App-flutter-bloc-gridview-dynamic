import 'package:giphy_flutter_app/core/constants/api_constants.dart';
import 'package:giphy_flutter_app/data/api/giphy_api.dart';
import 'package:giphy_flutter_app/data/dtos/base_response_dto.dart';
import 'package:giphy_flutter_app/domain/entities/base_response_entity.dart';

abstract class GiphyRemoteDataSource {
  Future<BaseResponseEntity?> getListGiphy();

  Future<BaseResponseEntity?> getListGiphyByName({
    required String search
  });
}

class IGiphyRemoteDataSource extends GiphyRemoteDataSource {

  final GiphyApi _giphyApi;

  IGiphyRemoteDataSource({
    GiphyApi? giphyApi
  }): _giphyApi = giphyApi ?? GiphyApi();

  /// Method that return data of list giphy
  @override
  Future<BaseResponseEntity?> getListGiphy()
  async{
    final BaseResponseDTO? response = await _giphyApi.getListGiphy(kUrlBase);
    if(response != null) {
      return BaseResponseEntity.fromDTO(dto: response);
    }
    return null;
  }

  /// Method that return data of list giphy by name
  @override
  Future<BaseResponseEntity?> getListGiphyByName({
  required String search
  })
  async{
    final BaseResponseDTO? response = await _giphyApi.getListGiphy('$kUrlSearch$search');
    if(response != null) {
      return BaseResponseEntity.fromDTO(dto: response);
    }
    return null;
  }

}