
import 'package:movie_app/domain/entities/download_storage_entities.dart';
import 'package:movie_app/domain/repositories/download_storage_repository.dart';

class GetAllDownloadStorageUseCase {
final DownloadStorageRepository downloadStorageRepository;
GetAllDownloadStorageUseCase(this.downloadStorageRepository);
List <DownloadStorageEntities> execute()=>downloadStorageRepository.getAllDownloadStorage();
}