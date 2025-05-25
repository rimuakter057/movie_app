
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/views/home_section/home/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          home: const HomeView(),
        );
      },
    );
  }
}
