
import 'package:movie_app/core/utils/assets_path.dart';
import 'package:movie_app/data/models/download_storage_model.dart';

class DownloadStorageDatasource {
  List<DownloadStorageModel> getMockDownloadStorage() {
    return  [
      DownloadStorageModel(
          title: 'hello',
          subtitle: 'subtitle',
          dataSize: '1gb',
          image: AssetsPath.tvImage1,
      ),
    ];
  }
}