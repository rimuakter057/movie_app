
import 'package:movie_app/domain/entities/download_storage_entities.dart';

abstract class DownloadStorageRepository {
  List <DownloadStorageEntity> getAllDownloadStorage();
}