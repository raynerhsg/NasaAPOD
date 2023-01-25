import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/excpetions.dart';
import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/features/space_images/data/datasource/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/space_images/data/datasource/space_media_datasource_impl.dart';
import 'package:nasa_clean_arch/features/space_images/data/models/space_media_model.dart';

import '../../../../mocks/space_media_mock.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late SpaceMediaDataSource dataSource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    dataSource = SpaceMediaDataSourceImpl(client);
  });
  final tDateTime = DateTime(2022, 1, 2);
  const String urlExpected =
      'https://api.nasa.gov/planetary/apod?api key=DEMO key&date=2021-02-02';

  void sucessMock() {
    when((() => client.get(any()))).thenAnswer(
      (invocation) async => HttpResponse(
        data: spaceMediaMock,
        statusCode: 200,
      ),
    );
  }

  test(
    'should call the get method with corret url',
    () async {
      sucessMock();
      await dataSource.getSpaceMediaFromDate(tDateTime);
      verify(() => client.get(any())).called(1);
    },
  );

  test('should return a SpaceMediaModel when is sucessful', () async {
    sucessMock();
    const tSpaceMediaModelExpected = SpaceMediaModel(
      description: 'description',
      mediaType: 'mediaType',
      title: 'title',
      url: 'url',
    );
    final result = await dataSource.getSpaceMediaFromDate(tDateTime);
    expect(result, tSpaceMediaModelExpected);
  });

  test('should throw a ServerExcpetion when call is unsuccesful', () {
    when((() => client.get(any()))).thenAnswer((invocation) async =>
        HttpResponse(data: 'Something went wrong', statusCode: 400));
    final result = dataSource.getSpaceMediaFromDate(tDateTime);
    expect(() => result, throwsA(ServerExcepetion()));
  });
}
