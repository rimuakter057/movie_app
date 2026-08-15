import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/views/favorites_section/favorites_list/favorites_list_view.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/home_view.dart';
import 'package:movie_app/presentation/views/library_section/contain_detail/content_details_view.dart';
import 'package:movie_app/presentation/views/live_stream_section/live_stream_three/live_stream_three_view.dart';
import 'package:movie_app/presentation/views/profile_section/download_storage_management/download_storage_management_view.dart';
import '../../binding/download_storage_binding.dart';

class MainBottomNavView extends StatefulWidget {
  const MainBottomNavView({super.key});
  static const routeName = '/main_bottom_nav';

  @override
  State<MainBottomNavView> createState() => _MainBottomNavViewState();
}

class _MainBottomNavViewState extends State<MainBottomNavView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    DownloadStorageBinding().dependencies();
  }

  final List<Widget> _pages = [
    const HomeView(),
    const LiveStreamThreeView(),
    const ContentDetailsView(),
    const FavoritesListView(),
    const DownloadStorageManagementView(),
  ];

  final List<IconData> _icons = [
    Icons.home_rounded,
    Icons.explore_rounded,
    Icons.movie_creation_rounded,
    Icons.favorite_rounded,
    Icons.person_rounded,
  ];

  final List<String> _labels = [
    'Home',
    'Explore',
    'Movies',
    'Favorites',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        height: 64.h,
        decoration: BoxDecoration(
          color: AppColors.cardDark.withOpacity(0.95),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: AppColors.glassBorder, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: AppColors.primary.withOpacity(0.15),
              blurRadius: 25,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(horizontal: isSelected ? 14.w : 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [AppColors.primary, AppColors.accentNeon],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  children: [
                    Icon(
                      _icons[index],
                      color: isSelected ? Colors.white : AppColors.secondaryText,
                      size: 20.r,
                    ),
                    if (isSelected) ...[
                      SizedBox(width: 6.w),
                      Text(
                        _labels[index],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}