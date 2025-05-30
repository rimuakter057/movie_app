import 'package:movie_app/data/datasources/home_item_data_sources.dart';
import 'package:movie_app/domain/entities/home_item_entity.dart';

import '../../domain/repositories/home_item_repository.dart';

class HomeItemRepositoryImpl implements HomeItemRepository {
  final HomeItemDataSources homeItemDataSources;
  HomeItemRepositoryImpl(this.homeItemDataSources);
  @override
  Future<List<HomeItemEntity>> getHomeImage() {
    return homeItemDataSources.getImageItems();
  }

  @override
  Future<List<HomeItemEntity>> getHomeImageSubTitle() {
    return homeItemDataSources.getImageSubTitleItems();
  }

  @override
  Future<List<HomeItemEntity>> getHomeImageTitle() {
    return homeItemDataSources.getImageTitleItems();
  }

}

// class ItemRepositoryImpl implements ItemRepository {
//   final MockItemRemoteDataSource remoteDataSource;
//
//   ItemRepositoryImpl(this.remoteDataSource);
//
//   @override
//   Future<List<ItemEntity>> getImageOnlyItems() {
//     return remoteDataSource.getImageOnlyItems();
//   }
//
//   @override
//   Future<List<ItemEntity>> getImageTitleItems() {
//     return remoteDataSource.getImageTitleItems();
//   }
//
//   @override
//   Future<List<ItemEntity>> getImageTitleSubtitleItems() {
//     return remoteDataSource.getImageTitleSubtitleItems();
//   }
// }
