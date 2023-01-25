import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_arch/features/space_images/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/space_images/domain/entities/space_media_entity.dart';

import '../../../../mocks/space_media_mock.dart';

void main() {
  const tSpaceMedia = SpaceMediaModel(
    description: 'description',
    mediaType: 'mediaType',
    title: 'title',
    url: 'url',
  );

  test('Should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMedia, isA<SpaceMediaEntity>());
  });

  test(
    'Should return a valid model',
    () {
      final jsonMap = jsonDecode(spaceMediaMock);
      final result = SpaceMediaModel.fromJson(jsonMap);
      expect(result, tSpaceMedia);
    },
  );
}
