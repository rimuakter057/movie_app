import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/views/library_section/contain_detail/content_details_view.dart';
import 'package:movie_app/presentation/widgets/category_pill_widget.dart';
import 'package:movie_app/presentation/widgets/movie_card_widget.dart';

class FavoritesListView extends StatefulWidget {
  const FavoritesListView({super.key});
  static const String routeName = "/favorites_list_view";

  @override
  State<FavoritesListView> createState() => _FavoritesListViewState();
}

class _FavoritesListViewState extends State<FavoritesListView> {
  int _selectedFilterIndex = 0;

  final List<Map<String, dynamic>> _favoriteMovies = [
    {
      "id": 1,
      "title": "Cyberpunk 2099",
      "genre": "Sci-Fi • Action",
      "rating": 9.2,
      "duration": "2h 15m",
      "image": "assets/images/home/stream_original1.png",
      "isDownloaded": true,
      "type": "Movies",
    },
    {
      "id": 2,
      "title": "Neon Horizon",
      "genre": "Mystery • Crime",
      "rating": 8.9,
      "duration": "1h 45m",
      "image": "assets/images/home/social_sharing_image.png",
      "isDownloaded": true,
      "type": "Movies",
    },
    {
      "id": 3,
      "title": "Shadow of the Dragon",
      "genre": "Fantasy • Drama",
      "rating": 8.8,
      "duration": "2h 10m",
      "image": "assets/images/home/stream_original2.png",
      "isDownloaded": false,
      "type": "TV Series",
    },
    {
      "id": 4,
      "title": "Hip Hop Road",
      "genre": "Documentary • Music",
      "rating": 8.7,
      "duration": "1h 50m",
      "image": "assets/images/home/tv_show_image1.png",
      "isDownloaded": true,
      "type": "Movies",
    },
    {
      "id": 5,
      "title": "The Last Echo",
      "genre": "Horror • Sci-Fi",
      "rating": 8.5,
      "duration": "1h 58m",
      "image": "assets/images/home/first_home_image1.png",
      "isDownloaded": false,
      "type": "TV Series",
    },
    {
      "id": 6,
      "title": "Speed Syndicate",
      "genre": "Action • Thriller",
      "rating": 9.0,
      "duration": "2h 04m",
      "image": "assets/images/home/tv_show_image2.png",
      "isDownloaded": false,
      "type": "Movies",
    },
  ];

  final List<Map<String, dynamic>> _recommended = [
    {
      "title": "Dark Matter 2025",
      "genre": "Sci-Fi • Thriller",
      "rating": 9.1,
      "duration": "2h 20m",
      "image": "assets/images/home/stream_original1.png",
    },
    {
      "title": "The Dark Knight",
      "genre": "Action • Crime",
      "rating": 9.0,
      "duration": "2h 32m",
      "image": "assets/images/home/social_sharing_image.png",
    },
    {
      "title": "Inception 4K",
      "genre": "Sci-Fi • Mystery",
      "rating": 8.8,
      "duration": "2h 28m",
      "image": "assets/images/home/stream_original2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered movies based on category selection
    final filteredMovies = _favoriteMovies.where((item) {
      if (_selectedFilterIndex == 1) return item["type"] == "Movies";
      if (_selectedFilterIndex == 2) return item["type"] == "TV Series";
      if (_selectedFilterIndex == 3) return item["isDownloaded"] == true;
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Top App Bar Header
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Watchlist",
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${_favoriteMovies.length} Saved Movies & Series",
                          style: GoogleFonts.poppins(
                            color: AppColors.secondaryText,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColors.cardDark,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.glassBorder),
                          ),
                          child: Icon(
                            Icons.tune_rounded,
                            color: Colors.white,
                            size: 18.r,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColors.cardDark,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.glassBorder),
                          ),
                          child: Icon(
                            Icons.favorite_rounded,
                            color: AppColors.red,
                            size: 20.r,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Watchlist Stats Overview Card
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(Icons.schedule_rounded, "12h 42m", "Total Duration"),
                    Container(width: 1, height: 28.h, color: AppColors.glassBorder),
                    _buildStatItem(Icons.movie_filter_rounded, "${_favoriteMovies.length}", "Saved Media"),
                    Container(width: 1, height: 28.h, color: AppColors.glassBorder),
                    _buildStatItem(Icons.cloud_download_rounded, "4.8 GB", "Downloaded"),
                  ],
                ),
              ),
            ),

            // Quick Play & Shuffle Action Buttons
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed(ContentDetailsView.routeName);
                        },
                        icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                        label: Text(
                          "Play All Watchlist",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.surfaceGlass,
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(color: AppColors.glassBorder),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            Get.snackbar(
                              "Shuffle Watchlist",
                              "Shuffling your saved movies...",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.cardDark,
                              colorText: Colors.white,
                            );
                          },
                          icon: Icon(Icons.shuffle_rounded, color: Colors.white, size: 18.r),
                          label: Text(
                            "Shuffle",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Category Filter Pills
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 14.h),
                child: CategoryPillWidget(
                  categories: [
                    'All Saved (${_favoriteMovies.length})',
                    '🎬 Movies',
                    '📺 TV Series',
                    '📥 Downloaded',
                  ],
                  onCategorySelected: (index) {
                    setState(() {
                      _selectedFilterIndex = index;
                    });
                  },
                ),
              ),
            ),

            // Grid of Favorite Movies
            filteredMovies.isEmpty
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: Center(
                        child: Text(
                          "No movies found in this category",
                          style: GoogleFonts.poppins(color: AppColors.secondaryText, fontSize: 13.sp),
                        ),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 14.h,
                        crossAxisSpacing: 14.w,
                        childAspectRatio: 0.68,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = filteredMovies[index];
                          final bool isDownloaded = item["isDownloaded"] == true;

                          return Stack(
                            children: [
                              MovieCardWidget(
                                title: item["title"],
                                genre: item["genre"],
                                rating: (item["rating"] as num).toDouble(),
                                duration: item["duration"],
                                imagePath: item["image"],
                                onTap: () {
                                  Get.toNamed(ContentDetailsView.routeName);
                                },
                              ),
                              // Remove Favorite Bookmark Button
                              Positioned(
                                top: 8.h,
                                left: 8.w,
                                child: GestureDetector(
                                  onTap: () {
                                    final removedItem = item;
                                    final removedIndex = _favoriteMovies.indexOf(item);
                                    setState(() {
                                      _favoriteMovies.remove(item);
                                    });
                                    Get.snackbar(
                                      "Removed",
                                      "${removedItem["title"]} removed from Watchlist",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppColors.cardDark,
                                      colorText: Colors.white,
                                      mainButton: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _favoriteMovies.insert(removedIndex, removedItem);
                                          });
                                          Get.back();
                                        },
                                        child: Text(
                                          "UNDO",
                                          style: GoogleFonts.poppins(
                                            color: AppColors.accentNeon,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(6.r),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.glassBorder),
                                    ),
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: Colors.white,
                                      size: 14.r,
                                    ),
                                  ),
                                ),
                              ),

                              // Download Status Indicator Tag
                              if (isDownloaded)
                                Positioned(
                                  bottom: 48.h,
                                  right: 8.w,
                                  child: Container(
                                    padding: EdgeInsets.all(4.r),
                                    decoration: BoxDecoration(
                                      color: AppColors.greenLive.withOpacity(0.9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: Colors.black,
                                      size: 12.r,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                        childCount: filteredMovies.length,
                      ),
                    ),
                  ),

            // Recommended Section Title
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h, bottom: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended for You",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: GoogleFonts.poppins(
                        color: AppColors.accentNeon,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Recommended Movies Horizontal List
            SliverToBoxAdapter(
              child: SizedBox(
                height: 245.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: _recommended.length,
                  itemBuilder: (context, index) {
                    final item = _recommended[index];
                    return MovieCardWidget(
                      title: item["title"],
                      genre: item["genre"],
                      rating: (item["rating"] as num).toDouble(),
                      duration: item["duration"],
                      imagePath: item["image"],
                      onTap: () {
                        Get.toNamed(ContentDetailsView.routeName);
                      },
                    );
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(height: 100.h),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.accentNeon, size: 14.r),
            SizedBox(width: 4.w),
            Text(
              value,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.secondaryText,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
