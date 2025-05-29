// class CategoryController extends GetxController {
//   final GetAllCategoriesUseCase getAllCategoriesUseCase;
//
//   CategoryController(this.getAllCategoriesUseCase);
//
//   RxList<CategoryEntity> categoryList = <CategoryEntity>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadCategories();
//   }
//
//   void loadCategories() {
//     categoryList.value = getAllCategoriesUseCase.execute();
//   }
// }
