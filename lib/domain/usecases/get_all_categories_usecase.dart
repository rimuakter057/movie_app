

import '../entities/category_entites.dart';
import '../repositories/category_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  List<CategoryEntity> execute() {
    return repository.getAllCategories();
  }
}
