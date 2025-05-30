

import 'package:get/get.dart';
import 'package:movie_app/domain/entities/download_storage_entities.dart';
import 'package:movie_app/domain/usecases/download_storage_usecase.dart';

class DownloadStorageController extends GetxController{
  final GetAllDownloadStorageUseCase getAllDownloadStorageUseCase;
  DownloadStorageController(this.getAllDownloadStorageUseCase);

  Future <List<DownloadStorageEntity>> getDownloadStorageFuture()async{
    await Future.delayed(Duration(seconds: 1)); // delay simulate
    return getAllDownloadStorageUseCase.execute();
  }
}


