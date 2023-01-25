import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  final String description;
  final String mediaType;
  final String title;
  final String url;

  const SpaceMediaEntity({
    required this.description,
    required this.mediaType,
    required this.title,
    required this.url,
  });

  @override
  List<Object?> get props => [
        title,
        url,
        description,
        mediaType,
      ];
}
