
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_app/presentation/binding/bunding.dart';
import 'package:movie_app/presentation/binding/download_storage_binding.dart';
import 'package:movie_app/presentation/binding/home_item_binding.dart';
import 'package:movie_app/presentation/routes/app_routes.dart';
import 'package:movie_app/presentation/views/favorites_section/favorites_list/favorites_list_view.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/home_view.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/recommended_view.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/social_shearing_view.dart';
import 'package:movie_app/presentation/views/library_section/contain_detail/content_details_view.dart';
import 'package:movie_app/presentation/views/library_section/content_library/content_library_view.dart';
import 'package:movie_app/presentation/views/live_stream_section/live_stream_three/live_stream_three_view.dart';
import 'package:movie_app/presentation/views/main_bottom_nav/main_bottom_nav_view.dart';
import 'package:movie_app/presentation/views/practice/home_item_view.dart';


void main(){
  runApp(MovieApp());
}


class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852), // Figma base screen size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
          ),

          initialRoute: MainBottomNavView.routeName,
          getPages: Routes.routes,
        );
      },
    );
  }
}













