import 'package:giphy_flutter_app/data/dtos/giphy_object_dto.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_image_entity.dart';

class GiphyObjectEntity {
  String type;
  String id;
  String url;
  String slug;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String rating;
  String contentUrl;
  String sourceTld;
  String sourcePostUrl;
  int isSticker;
  String trendingDatetime;
  GiphyImagesEntity images;

  GiphyObjectEntity({
    required this.type,
    required this.id,
    required this.url,
    required this.slug,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.title,
    required this.rating,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.isSticker,
    required this.trendingDatetime,
    required this.images
  });

  factory GiphyObjectEntity.fromGiphyObjectDTO(GiphyObjectDTO giphyObjectDTO) {
    return GiphyObjectEntity(
      type: giphyObjectDTO.type,
      id: giphyObjectDTO.id,
      url: giphyObjectDTO.url,
      slug: giphyObjectDTO.slug,
      bitlyUrl: giphyObjectDTO.bitlyUrl,
      embedUrl: giphyObjectDTO.embedUrl,
      username: giphyObjectDTO.username,
      source: giphyObjectDTO.source,
      title: giphyObjectDTO.title,
      rating: giphyObjectDTO.rating,
      contentUrl: giphyObjectDTO.contentUrl,
      sourceTld: giphyObjectDTO.sourceTld,
      sourcePostUrl: giphyObjectDTO.sourcePostUrl,
      isSticker: giphyObjectDTO.isSticker,
      trendingDatetime: giphyObjectDTO.trendingDatetime,
      images: GiphyImagesEntity.fromGiphyImagesDTO(giphyObjectDTO.images),
    );
  }
}