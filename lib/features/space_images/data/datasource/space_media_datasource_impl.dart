// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:nasa_clean_arch/core/errors/excpetions.dart';
import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/core/utils/keys/nasa_api_key.dart';
import 'package:nasa_clean_arch/features/space_images/data/datasource/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/space_images/data/endpoints/nasa_endpoint.dart';
import 'package:nasa_clean_arch/features/space_images/data/models/space_media_model.dart';

import '../../../../core/utils/converters/date_to_string_converter.dart';

class SpaceMediaDataSourceImpl implements SpaceMediaDataSource {
  HttpClient client;
  SpaceMediaDataSourceImpl(this.client);
  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime? date) async {
    final response = await client.get(NasaEndpoints.apod(
        NasaApiKeys.apiKey, DateToStringConverter.converter((date))));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerExcepetion();
    }
  }
}
