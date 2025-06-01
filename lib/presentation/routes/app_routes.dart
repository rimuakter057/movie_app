// lib/routes.dart
import 'package:get/get.dart';
import 'package:movie_app/presentation/binding/download_storage_binding.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/home_view.dart';
import 'package:movie_app/presentation/views/main_bottom_nav/main_bottom_nav_view.dart';
import '../binding/home_item_binding.dart';
import '../views/favorites_section/favorites_list/favorites_list_view.dart';
import '../views/home_section/social_sharing/social_shearing_view.dart';
import '../views/live_stream_section/live_stream_three/live_stream_three_view.dart';
import '../views/practice/home_item_view.dart';
import '../views/profile_section/download_storage_management/download_storage_management_view.dart';


class Routes {


  static final routes = [
    GetPage(
      name: HomeView.routeName,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: DownloadStorageManagementView.routeName,
      page: () => DownloadStorageManagementView(),
      binding: DownloadStorageBinding(),
    ),
    GetPage(
      name: MainBottomNavView.routeName,
      page: ()=>MainBottomNavView(),

    ),
    GetPage(
      name: LiveStreamThreeView.routeName,
      page: ()=>LiveStreamThreeView(),

    ),
    GetPage(
      name: SocialShearingView.routeName,
      page: ()=>SocialShearingView(),

    ),
    GetPage(
      name: FavoritesListView.routeName,
      page: ()=>FavoritesListView(),

    ),
  ];
}
