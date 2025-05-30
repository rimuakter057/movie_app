import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../data/datasources/category_local_datasource.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../domain/usecases/get_all_categories_usecase.dart';
import '../controller/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    final localDataSource = CategoryLocalDataSource();
    final repository = CategoryRepositoryImpl(localDataSource);
    final useCase = GetAllCategoriesUseCase(repository);

    Get.lazyPut<CategoryController>(() => CategoryController(useCase));
  }
}
