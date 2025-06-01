import 'package:get/get.dart';
import 'package:movie_app/data/datasources/home_item_data_sources.dart';
import 'package:movie_app/data/repositories/home_item_repository_impl.dart';

import '../../domain/repositories/home_item_repository.dart';
import '../../domain/usecases/home_data_usecase.dart';
import '../controller/home_item_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut(() => HomeItemDataSources());

  // Repository
    Get.lazyPut<HomeItemRepository>(() => HomeItemRepositoryImpl(Get.find()));

    // UseCase
    Get.lazyPut(() => GetHomeDataUseCase(Get.find()));

    // Controller
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
