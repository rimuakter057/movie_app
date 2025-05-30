
import 'package:movie_app/domain/entities/home_item_entity.dart';

abstract class HomeItemRepository {
  Future <List<HomeItemEntity>> getHomeImage();
  Future <List<HomeItemEntity>> getHomeImageTitle();
  Future <List<HomeItemEntity>> getHomeImageSubTitle();
}