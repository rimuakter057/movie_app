
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/recommended_view.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/social_shearing_view.dart';
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            textTheme: Typography.whiteCupertino,
          ),
          home: const DownloadStorageManagementView(),
        );
      },
    );
  }
}
