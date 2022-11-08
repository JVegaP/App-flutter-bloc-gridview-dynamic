import 'package:giphy_flutter_app/data/dtos/base_response_dto.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_object_entity.dart';

class BaseResponseEntity {
  List<GiphyObjectEntity>? data;
  dynamic pagination;
  dynamic meta;
  BaseResponseEntity({
    required this.data,
    this.pagination,
    this.meta
  });

  factory BaseResponseEntity.fromDTO({required BaseResponseDTO dto}) {
    return BaseResponseEntity(
        data: List<GiphyObjectEntity>.from(dto.data!.map((element) => GiphyObjectEntity.fromGiphyObjectDTO(element))),
        pagination: PaginationEntity.fromDTO(dto: dto.pagination),
        meta: MetaEntity.fromDTO(dto: dto.meta)
    );
  }
}

class PaginationEntity {
  int totalCount;
  int count;
  int offset;

  PaginationEntity({
    required this.totalCount,
    required this.count,
    required this.offset
  });

  factory PaginationEntity.fromDTO({required PaginationDTO? dto}) {
    return PaginationEntity(
        totalCount: dto?.totalCount ?? 0,
        count: dto?.count ?? 0,
        offset: dto?.offset ?? 0
    );
  }
}

class MetaEntity {
  int status;
  String msg;
  String responseId;

  MetaEntity({
    required this.status,
    required this.msg,
    required this.responseId
  });

  factory MetaEntity.fromDTO({required MetaDTO? dto}) {
    return MetaEntity(
        status: dto?.status ?? 500,
        msg: dto?.msg ?? "",
        responseId: dto?.responseId ?? ""
    );
  }
}