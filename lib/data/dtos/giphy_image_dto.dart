
class GiphyImagesDTO {
  GiphyImageDTO original;
  GiphyImageDTO downsized;
  GiphyImageDTO downsizedLarge;
  GiphyImageDTO downsizedMedium;
  GiphyImageDTO downsizedSmall;
  GiphyImageDTO fixedHeight;
  GiphyImageDTO fixedWidth;
  GiphyImageDTO previewGif;

  GiphyImagesDTO({
    required this.original,
    required this.downsized,
    required this.downsizedLarge,
    required this.downsizedMedium,
    required this.downsizedSmall,
    required this.fixedHeight,
    required this.previewGif,
    required this.fixedWidth
  });

  factory GiphyImagesDTO.fromJson(Map<String, dynamic> json) {
    return GiphyImagesDTO(
      original: GiphyImageDTO.fromJson(json['original']),
      downsized:  GiphyImageDTO.fromJson(json['downsized']),
      downsizedLarge:  GiphyImageDTO.fromJson(json['downsized_large']),
      downsizedMedium:  GiphyImageDTO.fromJson(json['downsized_medium']),
      downsizedSmall:  GiphyImageDTO.fromJson(json['downsized_small']),
      fixedHeight:  GiphyImageDTO.fromJson(json['fixed_height']),
      fixedWidth:  GiphyImageDTO.fromJson(json['fixed_width']),
      previewGif:  GiphyImageDTO.fromJson(json['preview_gif']),
    );
  }
}

class GiphyImageDTO {
  String height;
  String width;
  String size;
  String url;
  String webpSize;
  String webp;

  GiphyImageDTO({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.webpSize,
    required this.webp
  });

  factory GiphyImageDTO.fromJson(Map<String, dynamic> json) {
    return GiphyImageDTO(
        height: json['height'] == null ? "0" : json['height'] as String,
        width: json['width'] == null ? "0" : json['width'] as String,
        size: json['size'] == null ? "" : json['size'] as String,
        url: json['url'] == null ? "" : json['url'] as String,
        webpSize: json['webp_size'] == null ? "" : json['webp_size'] as String,
        webp: json['webp'] == null ? "" : json['webp'] as String
    );
  }
}