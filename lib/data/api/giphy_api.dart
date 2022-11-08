import 'dart:convert';
import 'package:http/http.dart';

import 'package:giphy_flutter_app/core/constants/api_constants.dart';
import 'package:giphy_flutter_app/data/dtos/base_response_dto.dart';

class GiphyApi {

  Map<String, String> headers = <String, String>{
    kContentType: kApplicationJson
  };

  /// -------------------- PUBLIC METHODS --------------------

  Future<BaseResponseDTO?> getListGiphy(String url) async{
    final Map<dynamic, dynamic>? response = await
    _callGet(
        url: url,
        headers: headers
    );
    final BaseResponseDTO? result = BaseResponseDTO.fromJson(response);
    return result;
  }

  /// -------------------- PRIVATE METHODS --------------------

  /// Method that makes use of the GET operator to make an http request
  Future<dynamic> _callGet({
    required String url,
    Map<String, String>? headers,
  }) async {
    final dynamic request = await _apiCall(
        get(
            Uri.parse(url),
            headers: headers
        )
    );
    return request;
  }

  /// Method that make an http request
  Future<dynamic> _apiCall(Future<Response> serviceCall) async {
    try{
      final Response call = await serviceCall;
      final dynamic decodeResponse = jsonDecode(call.body);
      return decodeResponse;
    } on Exception catch (_) {
      return null;
    }
  }
}