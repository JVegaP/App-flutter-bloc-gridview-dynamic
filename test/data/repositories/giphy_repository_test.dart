import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_flutter_app/data/datasource/remote/giphy_remote_data_source.dart';
import 'package:giphy_flutter_app/data/repositories/giphy_repository_imp.dart';
import 'package:giphy_flutter_app/domain/entities/base_response_entity.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_image_entity.dart';
import 'package:giphy_flutter_app/domain/entities/giphy_object_entity.dart';
import 'package:giphy_flutter_app/domain/repositories/giphy_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockGiphyRemoteDataSource extends Mock implements GiphyRemoteDataSource {}
main() {

  final MockGiphyRemoteDataSource mockGiphyRemoteDataSource = MockGiphyRemoteDataSource();
  GiphyRepository getGiphyRepository = IGiphyRepository(
      giphyRemoteDataSource: mockGiphyRemoteDataSource
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
      verifyNoMoreInteractions(mockGiphyRemoteDataSource);
    });

    List<GiphyObjectEntity> items = [];
    items.add(giphyObjectEntity);

    test("Get list giphy by name success", () async {
      BaseResponseEntity baseResponseEntity = BaseResponseEntity(
          data: items,
          meta: MetaEntity(status: 200, msg: "OK", responseId: "1")
      );

      when(() => mockGiphyRemoteDataSource.getListGiphyByName(search: 'test')).thenAnswer((_) async => baseResponseEntity);

      var result = await getGiphyRepository.getListGiphyByName(search: 'test');
      expect(result.length, 1);

      verify(() => mockGiphyRemoteDataSource.getListGiphyByName(search: 'test'));
    });

    test("Get list giphy by name failed", () async {
      BaseResponseEntity baseResponseEntity = BaseResponseEntity(
          data: items,
          meta: MetaEntity(status: 400, msg: "Bad Request", responseId: "1")
      );

      when(() => mockGiphyRemoteDataSource.getListGiphyByName(search: 'test')).thenAnswer((_) async => baseResponseEntity);

      var result = await getGiphyRepository.getListGiphyByName(search: 'test');
      expect(result.length, 0);

      verify(() => mockGiphyRemoteDataSource.getListGiphyByName(search: 'test'));
    });

    test("Get list giphy by name error", () async {
      when(() => mockGiphyRemoteDataSource.getListGiphyByName(search: 'test')).thenAnswer((_) async => null);

      var result = await getGiphyRepository.getListGiphyByName(search: 'test');
      expect(result.length, 0);

      verify(() => mockGiphyRemoteDataSource.getListGiphyByName(search: 'test'));
    });

  });


  group("Get list giphy Test", () {
    tearDown(() {
      verifyNoMoreInteractions(mockGiphyRemoteDataSource);
    });

    List<GiphyObjectEntity> items = [];
    items.add(giphyObjectEntity);

    test("Get list giphy success", () async {
      BaseResponseEntity baseResponseEntity = BaseResponseEntity(
          data: items,
          meta: MetaEntity(status: 200, msg: "OK", responseId: "1")
      );

      when(() => mockGiphyRemoteDataSource.getListGiphy()).thenAnswer((_) async => baseResponseEntity);

      var result = await getGiphyRepository.getListGiphy();
      expect(result.length, 1);

      verify(() => mockGiphyRemoteDataSource.getListGiphy());
    });

    test("Get list giphy failed", () async {
      BaseResponseEntity baseResponseEntity = BaseResponseEntity(
          data: items,
          meta: MetaEntity(status: 400, msg: "Bad Request", responseId: "1")
      );

      when(() => mockGiphyRemoteDataSource.getListGiphy()).thenAnswer((_) async => baseResponseEntity);

      var result = await getGiphyRepository.getListGiphy();
      expect(result.length, 0);

      verify(() => mockGiphyRemoteDataSource.getListGiphy());
    });

    test("Get list giphy error", () async {
      when(() => mockGiphyRemoteDataSource.getListGiphy()).thenAnswer((_) async => null);

      var result = await getGiphyRepository.getListGiphy();
      expect(result.length, 0);

      verify(() => mockGiphyRemoteDataSource.getListGiphy());
    });

  });

}