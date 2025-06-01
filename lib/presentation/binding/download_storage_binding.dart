


import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:movie_app/domain/repositories/download_storage_repository.dart';

import '../../data/datasources/download_storage_datasource.dart';
import '../../data/repositories/download_storage_impl.dart';
import '../../domain/usecases/download_storage_usecase.dart';
import '../controller/download_storage_controller.dart';
//
// class DownloadStorageBinding extends Bindings {
//   @override
//   void dependencies() {
// final localDataSource=DownloadStorageDatasource();
// // Repository
// Get.lazyPut<DownloadStorageRepository>(() => DownloadStorageImpl(Get.find()));
//
// //final repository=DownloadStorageImpl(localDataSource);
// final useCase=GetAllDownloadStorageUseCase(repository);
//
// Get.lazyPut<DownloadStorageController>(() => DownloadStorageController(useCase));
//   }
//
// }
//


class DownloadStorageBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut(() => DownloadStorageDatasource());

    // Repository
    Get.lazyPut<DownloadStorageRepository>(() => DownloadStorageImpl(Get.find()));

    // UseCase
    Get.lazyPut(() => GetAllDownloadStorageUseCase(Get.find()));

    // Controller
    Get.lazyPut(() => DownloadStorageController(Get.find()));
  }
}
