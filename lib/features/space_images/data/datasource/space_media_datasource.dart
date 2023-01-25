import '../models/space_media_model.dart';

abstract class SpaceMediaDataSource {
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime? date);
}
