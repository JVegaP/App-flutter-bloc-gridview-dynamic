import 'package:giphy_flutter_app/data/dtos/giphy_image_dto.dart';

class GiphyObjectDTO {
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
  GiphyImagesDTO images;

  GiphyObjectDTO({
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

  factory GiphyObjectDTO.fromJson(Map<String, dynamic> json) {
    return GiphyObjectDTO(
      type: json['type'] as String,
      id: json['id'] as String,
      url: json['url'] as String,
      slug: json['slug'] as String,
      bitlyUrl: json['bitly_url'] as String,
      embedUrl: json['embed_url'] as String,
      username: json['username'] as String,
      source: json['source'] as String,
      title: json['title'] as String,
      rating: json['rating'] as String,
      contentUrl: json['content_url'] as String,
      sourceTld: json['source_tld'] as String,
      sourcePostUrl: json['source_post_url'] as String,
      isSticker: json['is_sticker'] as int,
      trendingDatetime: json['trending_datetime'] as String,
      images: GiphyImagesDTO.fromJson(json['images'])
    );
  }
}