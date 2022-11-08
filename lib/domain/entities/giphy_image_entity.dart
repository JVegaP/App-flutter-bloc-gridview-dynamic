import 'package:giphy_flutter_app/data/dtos/giphy_image_dto.dart';

class GiphyImagesEntity {
  GiphyImageEntity original;
  GiphyImageEntity downsized;
  GiphyImageEntity downsizedLarge;
  GiphyImageEntity downsizedMedium;
  GiphyImageEntity downsizedSmall;
  GiphyImageEntity fixedHeight;
  GiphyImageEntity fixedWidth;
  GiphyImageEntity previewGif;

  GiphyImagesEntity({
    required this.original,
    required this.downsized,
    required this.downsizedLarge,
    required this.downsizedMedium,
    required this.downsizedSmall,
    required this.fixedHeight,
    required this.previewGif,
    required this.fixedWidth
  });

  factory GiphyImagesEntity.fromGiphyImagesDTO(GiphyImagesDTO giphyImagesDTO) {
    return GiphyImagesEntity(
      original: GiphyImageEntity.fromGiphyImageDTO(giphyImagesDTO.original),
      downsized: GiphyImageEntity.fromGiphyImageDTO(giphyImagesDTO.downsized),
      downsizedLarge: GiphyImageEntity.fromGiphyImageDTO(giphyImagesDTO.downsizedLarge),
      downsizedMedium: GiphyImageEntity.fromGiphyImageDTO(giphyImagesDTO.downsizedMedium),
      downsizedSmall: GiphyImageEntity.fromGiphyImageDTO(giphyImagesDTO.downsizedSmall),
      fixedHeight: GiphyImageEntity.fromGiphyImageDTO(giphyImagesDTO.fixedHeight),
      fixedWidth: GiphyImageEntity.fromGiphyImageDTO(giphyImagesDTO.fixedWidth),
      previewGif: GiphyImageEntity.fromGiphyImageDTO(giphyImagesDTO.previewGif),
    );
  }
}

class GiphyImageEntity {
  String height;
  String width;
  String size;
  String url;
  String webpSize;
  String webp;

  GiphyImageEntity({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.webpSize,
    required this.webp
  });

  factory GiphyImageEntity.fromGiphyImageDTO(GiphyImageDTO giphyImageDTO) {
    return GiphyImageEntity(
        height: giphyImageDTO.height,
        width: giphyImageDTO.width,
        size: giphyImageDTO.size,
        url: giphyImageDTO.url,
        webpSize: giphyImageDTO.webpSize,
        webp: giphyImageDTO.webp
    );
  }
}