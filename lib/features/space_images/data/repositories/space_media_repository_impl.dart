import 'package:dartz/dartz.dart';

import '../../../../core/errors/excpetions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/space_media_entity.dart';
import '../../domain/repositories/space_media_repository.dart';
import '../datasource/space_media_datasource.dart';

class SpaceMediaRepositoryImpl implements SpaceMediaRepository {
  final SpaceMediaDataSource datasource;

  SpaceMediaRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime? date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerExcepetion {
      return Left(ServerFailure());
    }
  }
}
