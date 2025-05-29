
import '../../domain/entities/category_entities.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_local_datasource.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryLocalDataSource localDataSource;

  CategoryRepositoryImpl(this.localDataSource);

  @override
  List<CategoryEntity> getAllCategories() {
    return localDataSource.getMockCategories();
  }
}
