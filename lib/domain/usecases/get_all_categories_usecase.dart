

import '../entities/category_entities.dart';
import '../repositories/category_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  List<CategoryEntity> execute() {
    return repository.getAllCategories();
  }
}
