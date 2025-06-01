import 'package:get/get.dart';
import '../../domain/entities/home_item_entity.dart';

import '../../domain/usecases/home_data_usecase.dart';

class HomeController extends GetxController {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeController(this.getHomeDataUseCase);


  Future<Map<String, List<HomeItemEntity>>> getHomeItemsFuture() async {
    await Future.delayed(Duration(seconds: 1));
    return getHomeDataUseCase.execute();
  }

}

// class CategoryController extends GetxController {
//   final GetAllCategoriesUseCase getAllCategoriesUseCase;
//
//   CategoryController(this.getAllCategoriesUseCase);
//
//   Future<List<CategoryEntity>> getCategoriesFuture() async {
//     await Future.delayed(Duration(seconds: 1)); // delay simulate
//     return getAllCategoriesUseCase.execute();
//   }
// }
