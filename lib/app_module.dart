import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_clean_arch/features/space_images/data/datasource/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/space_images/data/datasource/space_media_datasource_impl.dart';
import 'package:nasa_clean_arch/features/space_images/data/repositories/space_media_repository_impl.dart';
import 'package:nasa_clean_arch/features/space_images/domain/repositories/space_media_repository.dart';
import 'package:nasa_clean_arch/features/space_images/domain/usecase/get_space_media_from_date_usecase.dart';

import 'features/space_images/presenter/controllers/home_store.dart';
import 'features/space_images/presenter/pages/home_page.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => HomeStore(i())),
        Bind((i) => GetSpaceMediaFromDateUsecase(i())),
        Bind((i) => http.Client()),
        Bind((i) => SpaceMediaDataSourceImpl(i())),
        Bind((i) => SpaceMediaRepositoryImpl(i()))
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
        // ChildRoute('/picture', child: (_, __) => const PicturePage()),
      ];
}
