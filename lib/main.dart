
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_app/presentation/routes/app_routes.dart';
import 'package:movie_app/presentation/views/library_section/contain_detail/content_details_view.dart';

import 'package:movie_app/presentation/views/live_stream_section/live_stream_three/live_short_view.dart';
import 'package:movie_app/presentation/views/main_bottom_nav/main_bottom_nav_view.dart';
import 'package:movie_app/presentation/views/profile_section/download_storage_management/download_storage_management_view.dart';


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
          //home: (),
        );
      },
    );
  }
}













