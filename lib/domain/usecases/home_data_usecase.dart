import '../entities/home_item_entity.dart';
import '../repositories/home_item_repository.dart';

class GetHomeDataUseCase {
  final HomeItemRepository homeItemRepository;

  GetHomeDataUseCase(this.homeItemRepository);

  Future<Map<String, List<HomeItemEntity>>> execute() async {
    final homeImage = await homeItemRepository.getHomeImage();
    final homeImageTitle = await homeItemRepository.getHomeImageTitle();
    final homeImageSubTitle = await homeItemRepository.getHomeImageSubTitle();

    return {
      "homeImage": homeImage,
      "homeImageTitle": homeImageTitle,
      "homeImageSubTitle": homeImageSubTitle,
    };
  }
}





// class GetHomeDataUseCase {
//   final ItemRepository repository;
//
//   GetHomeDataUseCase(this.repository);
//
//   Future<Map<String, List<ItemEntity>>> call() async {
//     final imageOnly = await repository.getImageOnlyItems();
//     final imageTitle = await repository.getImageTitleItems();
//     final imageTitleSubtitle = await repository.getImageTitleSubtitleItems();
//
//     return {
//       "imageOnly": imageOnly,
//       "imageTitle": imageTitle,
//       "imageTitleSubtitle": imageTitleSubtitle,
//     };
//   }

