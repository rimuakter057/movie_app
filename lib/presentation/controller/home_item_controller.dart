import 'package:get/get.dart';
import '../../domain/entities/home_item_entity.dart';

import '../../domain/usecases/home_data_usecase.dart';

class HomeController extends GetxController {
  final GetHomeDataUseCase useCase;

  List<HomeItemEntity> imageOnly = [];
  List<HomeItemEntity> imageTitle = [];
  List<HomeItemEntity> imageTitleSubtitle = [];

  HomeController(this.useCase);

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final data = await useCase.execute();
    imageOnly = data['homeImage'] ?? [];
    imageTitle = data['homeImageTitle'] ?? [];
    imageTitleSubtitle = data['homeImageSubTitle'] ?? [];

    update();
  }
}
