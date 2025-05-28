import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/views/favorites_section/favorites_list/favorites_list_view.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/home_view.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/social_shearing_view.dart';
import 'package:movie_app/presentation/views/live_stream_section/live_stream_three/live_stream_three_view.dart';
import 'package:movie_app/presentation/views/profile_section/download_storage_management/download_storage_management_view.dart';

class MainBottomNavView extends StatefulWidget {
  const MainBottomNavView({super.key});

  @override
  State<MainBottomNavView> createState() => _MainBottomNavViewState();
}

class _MainBottomNavViewState extends State<MainBottomNavView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    LiveStreamThreeView(),
    SocialShearingView(),
    FavoritesListView(),
    DownloadStorageManagementView(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.person,
  ];

  final List<String> _labels = [
    'Home',
    'Live Stream',
    'Library',
    'Favorites',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white, // Selected label color
        unselectedItemColor: AppColors.secondaryText, // Unselected label color
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: AppColors.secondaryText),
        items: List.generate(_icons.length, (index) {
          bool isSelected = _selectedIndex == index;

          return BottomNavigationBarItem(
            label: _labels[index],

            // Unselected icon
            icon: Container(
              height: 48.h,
              width: 48.w,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icons[index],
                color: AppColors.secondaryText,
              ),
            ),

            // Selected icon
            activeIcon: Container(
              height: 48.h,
              width: 48.w,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.primary15,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icons[index],
                color: AppColors.primary,
              ),
            ),
          );
        }),
      ),

    );
  }
}
