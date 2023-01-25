// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_triple/flutter_triple.dart';
import 'package:nasa_clean_arch/features/space_images/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_arch/features/space_images/domain/usecase/get_space_media_from_date_usecase.dart';

import '../../../../core/errors/failure.dart';

class HomeStore extends NotifierStore<Failure, SpaceMediaEntity> {
  final GetSpaceMediaFromDateUsecase usecase;
  HomeStore(this.usecase)
      : super(const SpaceMediaEntity(
          description: 'description',
          mediaType: 'mediaType',
          title: 'title',
          url: 'url',
        ));

  getSpaceMediaFromDateUsecase(DateTime? date) async {
    // executeEither(() => usecase(date)); // -> Need to use EitherAdapter to work

    setLoading(true);
    final result = await usecase(date);
    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);
  }
}
