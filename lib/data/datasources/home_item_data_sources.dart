import 'package:movie_app/data/models/home_item_model.dart';

import '../../core/utils/assets_path.dart';

class HomeItemDataSources{
  Future<List<HomeItemModel>> getImageItems()async{
    await Future.delayed(Duration(seconds: 1));
    return [
      HomeItemModel(image: AssetsPath.firstHomeImage1),
      HomeItemModel(image: AssetsPath.firstHomeImage2),
      HomeItemModel(image: AssetsPath.firstHomeImage3),
      HomeItemModel(image: AssetsPath.firstHomeImage4),
      HomeItemModel(image: AssetsPath.firstHomeImage5),
      HomeItemModel(image: AssetsPath.liveImage1),
      HomeItemModel(image: AssetsPath.firstHomeImage1),
      HomeItemModel(image: AssetsPath.firstHomeImage2),
      HomeItemModel(image: AssetsPath.firstHomeImage3),
    ];
  }
  Future<List<HomeItemModel>> getImageTitleItems()async{
    await Future.delayed(Duration(seconds: 1));
    return [
      HomeItemModel(image: AssetsPath.streamOriginalHomeImage1,
          title: "Hip Hop Road\nRedemption"),
      HomeItemModel(image: AssetsPath.streamOriginalHomeImage1,
      title: "Dirty game"
      ),
      HomeItemModel(image: AssetsPath.streamOriginalHomeImage1,
          title: "Hip Hop Road\nRedemption"),
      HomeItemModel(image: AssetsPath.streamOriginalHomeImage1,
          title: "Dirty game"
      ),
    ];
  }
  Future<List<HomeItemModel>> getImageSubTitleItems()async{
    await Future.delayed(Duration(seconds: 1));
    return [
      HomeItemModel(
        image: AssetsPath.tvShowHomeImage1,
        title: "Today 8:00 AM:",
        subtitle: "Lakers VS Grizzlies",
      ),
      HomeItemModel(image: AssetsPath.tvShowHomeImage2,
        title: "Lakers vs. Miami",
        subtitle: "Highlights I Dec 28",
      ),
      HomeItemModel(image: AssetsPath.tvShowHomeImage3,
        title: "Sunday's Highlight",
        subtitle: " Reel",
      ),
    ];
  }
}



