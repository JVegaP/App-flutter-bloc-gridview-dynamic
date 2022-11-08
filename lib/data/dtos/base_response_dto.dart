import 'package:giphy_flutter_app/data/dtos/giphy_object_dto.dart';

class BaseResponseDTO {
  List<GiphyObjectDTO>? data;
  PaginationDTO? pagination;
  MetaDTO? meta;

  BaseResponseDTO({
    this.data,
    this.pagination,
    this.meta
  });

  static BaseResponseDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) {
      return null;
    }
    if(json['data'] == null &&
        json['pagination'] == null &&
        json['meta'] == null
    ) {
      return null;
    }
    return BaseResponseDTO(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GiphyObjectDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null ? null : json['pagination'] is Map<String, dynamic> ? PaginationDTO.fromJson(json['pagination']) : null,
      meta: json['meta'] == null ? null : json['meta'] is Map<String, dynamic> ? MetaDTO.fromJson(json['meta']) : null,
    );
  }

}

class PaginationDTO {
  int totalCount;
  int count;
  int offset;

  PaginationDTO({
    required this.totalCount,
    required this.count,
    required this.offset
  });

  factory PaginationDTO.fromJson(Map<String, dynamic> json) {
    return PaginationDTO(
        totalCount: json['total_count'] as int,
        count: json['count'] as int,
        offset: json['offset'] as int
    );
  }
}

class MetaDTO {
  int status;
  String msg;
  String responseId;

  MetaDTO({
    required this.status,
    required this.msg,
    required this.responseId
  });

  factory MetaDTO.fromJson(Map<String, dynamic> json) {
    return MetaDTO(
        status: json['status'] as int,
        msg: json['msg'] as String,
        responseId: json['response_id'] as String
    );
  }
}