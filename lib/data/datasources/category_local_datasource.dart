import '../models/category_model.dart';

class CategoryLocalDataSource {
  List<CategoryModel> getMockCategories() {
    return [
      CategoryModel(id: '1', name: 'Electronics'),
      CategoryModel(id: '2', name: 'Groceries'),
      CategoryModel(id: '3', name: 'Fashion'),
      CategoryModel(id: '4', name: 'Books'),
    ];
  }
}
