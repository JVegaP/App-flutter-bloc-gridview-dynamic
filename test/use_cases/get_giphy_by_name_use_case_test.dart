import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_image_entity.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_object_entity.dart';
import 'package:giphy_flutter_app/domain/repositories/giphy_repository.dart';
import 'package:giphy_flutter_app/domain/use_cases/get_giphy_by_name_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockGiphyRepository extends Mock implements GiphyRepository {}
main() {

  final MockGiphyRepository mockGiphyRepository = MockGiphyRepository();
  GetGiphyByNameUseCase getGiphyBynNameUseCase = GetGiphyByNameUseCase(
      giphyRepository: mockGiphyRepository
  );

  final GiphyImageEntity giphyImageEntity = GiphyImageEntity(
      height: "100",
      width: "200",
      size: "100",
      url: "url",
      webpSize: "webpSize",
      webp: "webp"
  );

  GiphyObjectEntity giphyObjectEntity = GiphyObjectEntity(
      type: "type",
      id: "id",
      url: "url",
      slug: "slug",
      bitlyUrl: "bitlyUrl",
      embedUrl: "embedUrl",
      username: "username",
      source: "source",
      title: "title",
      rating: "rating",
      contentUrl: "contentUrl",
      sourceTld: "sourceTld",
      sourcePostUrl: "sourcePostUrl",
      isSticker: 0,
      trendingDatetime: "trendingDatetime",
      images:  GiphyImagesEntity(
          original: giphyImageEntity,
          downsized: giphyImageEntity,
          downsizedLarge: giphyImageEntity,
          downsizedMedium: giphyImageEntity,
          downsizedSmall: giphyImageEntity,
          fixedHeight: giphyImageEntity,
          previewGif: giphyImageEntity,
          fixedWidth: giphyImageEntity
      )
  );


  group("Get list giphy by name Test", () {
    tearDown(() {
      verifyNoMoreInteractions(mockGiphyRepository);
    });

    List<GiphyObjectEntity> items = [];
    items.add(giphyObjectEntity);

    test("Get list giphy by name with value", () async{
      when(() => mockGiphyRepository.getListGiphyByName(search: 'test')).thenAnswer((_) async => items);

      var result = await getGiphyBynNameUseCase.invoke(search: 'test');
      expect(result.length, 1);

      verify(() => mockGiphyRepository.getListGiphyByName(search: 'test'));
    });

  });

}