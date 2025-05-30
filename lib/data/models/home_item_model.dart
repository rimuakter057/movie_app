
import 'package:movie_app/domain/entities/home_item_entity.dart';

class HomeItemModel extends HomeItemEntity{
  HomeItemModel({
    required super.image,
    super.title,
    super.subtitle,
  });
  factory HomeItemModel.fromJson(Map<String, dynamic> jsonData){
    return HomeItemModel(
        image: jsonData['image'],
      title: jsonData['title'],
      subtitle: jsonData['subtitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'subtitle': subtitle,
    };
  }

}