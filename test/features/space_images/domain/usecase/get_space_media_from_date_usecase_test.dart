import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/failure.dart';
import 'package:nasa_clean_arch/features/space_images/domain/repositories/space_media_repository.dart';
import 'package:nasa_clean_arch/features/space_images/domain/usecase/get_space_media_from_date_usecase.dart';
import '../../../../mocks/date_mock.dart';
import '../../../../mocks/space_media_entity_mock.dart';

class MockSpaceRepository extends Mock implements SpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late SpaceMediaRepository repository;
  setUp(() {
    repository = MockSpaceRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  test(
    'should get space media entity for a given date from repository',
    () async {
      when(() => repository.getSpaceMediaFromDate(tDate))
          .thenAnswer((invocation) async => const Right(tSpaceMedia));
      final result = await usecase(tDate);
      expect(result, const Right(tSpaceMedia));
      verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
    },
  );

  test(
    'Should return a ServerFailure when don\'t succed',
    () async {
      when(() => repository.getSpaceMediaFromDate(tDate))
          .thenAnswer((invocation) async => Left(ServerFailure()));
      final result = await usecase(tDate);

      expect(result, Left(ServerFailure()));
      verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
    },
  );
  test(
    'Should return a NullParamsFailure when recevies a null param',
    () async {
      when(() => repository.getSpaceMediaFromDate(null))
          .thenAnswer((invocation) async => Left(NullParamsFailure()));
      final result = await usecase(null);
      expect(result, Left(NullParamsFailure()));
      verifyNever(() => repository.getSpaceMediaFromDate(tDate)).called(0);
    },
  );
}
