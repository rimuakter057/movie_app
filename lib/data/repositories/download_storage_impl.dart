import 'package:movie_app/data/datasources/download_storage_datasource.dart';
import 'package:movie_app/domain/entities/download_storage_entities.dart';
import 'package:movie_app/domain/repositories/download_storage_repository.dart';

class DownloadStorageImpl extends DownloadStorageRepository {
  final DownloadStorageDatasource downloadStorageDatasource;
  DownloadStorageImpl(this.downloadStorageDatasource);
  @override
  List<DownloadStorageEntity> getAllDownloadStorage() {
    return downloadStorageDatasource.getMockDownloadStorage();
  }

}

