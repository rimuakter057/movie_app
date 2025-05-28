

import '../entities/category_entites.dart';

abstract class CategoryRepository {
  List<CategoryEntity> getAllCategories();
}
