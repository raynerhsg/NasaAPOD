import '../../domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  const SpaceMediaModel({
    required super.description,
    required super.mediaType,
    required super.title,
    required super.url,
  });

  factory SpaceMediaModel.fromJson(Map<String, dynamic> data) =>
      SpaceMediaModel(
        description: data['explanation'],
        mediaType: data['media_type'],
        title: data['title'],
        url: data['url'],
      );

  Map<String, dynamic> toJson() => {
        'explanation': description,
        'media_type': mediaType,
        'title': title,
        'url': url,
      };
}
