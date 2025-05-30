import 'package:movie_app/data/models/home_item_model.dart';

import '../../core/utils/assets_path.dart';

class HomeItemDataSources{
  Future<List<HomeItemModel>> getImageItems()async{
    await Future.delayed(Duration(seconds: 1));
    return [
      HomeItemModel(image: AssetsPath.tvImage1),
      HomeItemModel(image: AssetsPath.liveImage1),
    ];
  }
  Future<List<HomeItemModel>> getImageTitleItems()async{
    await Future.delayed(Duration(seconds: 1));
    return [
      HomeItemModel(image: AssetsPath.tvImage1,
      title: "image title",
      ),
      HomeItemModel(image: AssetsPath.liveImage1,
        title: "image title2",
      ),
    ];
  }
  Future<List<HomeItemModel>> getImageSubTitleItems()async{
    await Future.delayed(Duration(seconds: 1));
    return [
      HomeItemModel(image: AssetsPath.tvImage1,
        title: "image title",
        subtitle: "image subtitle",
      ),
      HomeItemModel(image: AssetsPath.liveImage1,
        title: "image title2",
        subtitle: "image subtitle2",
      ),
    ];
  }
}



