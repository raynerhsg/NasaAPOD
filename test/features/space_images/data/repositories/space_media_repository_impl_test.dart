import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/excpetions.dart';
import 'package:nasa_clean_arch/core/errors/failure.dart';
import 'package:nasa_clean_arch/features/space_images/data/datasource/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/space_images/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/space_images/data/repositories/space_media_repository_impl.dart';

class MockSpaceMediaDataSource extends Mock implements SpaceMediaDataSource {}

void main() {
  late SpaceMediaRepositoryImpl repository;
  late SpaceMediaDataSource dataSource;
  setUp(() {
    dataSource = MockSpaceMediaDataSource();
    repository = SpaceMediaRepositoryImpl(dataSource);
  });

  const tSpaceMedia = SpaceMediaModel(
      description: 'description',
      mediaType: 'mediaType',
      title: 'title',
      url: 'url');

  final tDate = DateTime(2022, 1, 10);
  test('Should return space media model whenn calls the datasource', () async {
    // when(dataSource)
    //     .calls(#getSpaceMediaFromDate)
    //     .thenAnswer((_) async => tSpaceMediaModel);

    // final result =
    //     await repository.getSpaceMediaFromDate(tDate);

    // expect(result, const Right(tSpaceMedia));
    // verify(dataSource)
    //     .called(#getSpaceMediaFromDate)
    //     .withArgs(positional: [tDate]).once();
  });

  test(
      'Should return a ServerFailure when  the call the datasource is unsucessful',
      () async {
    // when(dataSource)
    //     .calls(#getSpaceMediaFromDate)
    //     .thenThrow((_) async => ServerExcepetion());

    // final result =
    //     await repository.getSpaceMediaFromDate(tDate);

    // expect(result, const Left(ServerExcepetion());
    // verify(dataSource)
    //     .called(#getSpaceMediaFromDate)
    //     .withArgs(positional: [tDate]).once();
  });
}
