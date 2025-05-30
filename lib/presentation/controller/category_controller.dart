import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../domain/entities/category_entities.dart';
import '../../domain/usecases/get_all_categories_usecase.dart';

class CategoryController extends GetxController {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  CategoryController(this.getAllCategoriesUseCase);

  Future<List<CategoryEntity>> getCategoriesFuture() async {
    await Future.delayed(Duration(seconds: 1)); // delay simulate
    return getAllCategoriesUseCase.execute();
  }
}
