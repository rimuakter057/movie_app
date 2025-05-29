

import '../entities/category_entities.dart';

abstract class CategoryRepository {
  List<CategoryEntity> getAllCategories();
}
