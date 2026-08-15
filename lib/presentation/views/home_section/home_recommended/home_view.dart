import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/views/library_section/contain_detail/content_details_view.dart';
import 'package:movie_app/presentation/widgets/continue_watching_widget.dart';
import 'package:movie_app/presentation/widgets/movie_card_widget.dart';
import 'package:movie_app/presentation/widgets/top_10_rank_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {"name": "🔥 Trending", "icon": Icons.local_fire_department_rounded},
    {"name": "🎬 Movies", "icon": Icons.movie_rounded},
    {"name": "📺 TV Series", "icon": Icons.tv_rounded},
    {"name": "🎛️ Genres", "icon": Icons.grid_view_rounded},
  ];

  final List<Map<String, dynamic>> _continueWatching = [
    {
      "title": "The Last Sentinel",
      "duration": "1h 12m left",
      "progress": 0.65,
      "image": "assets/images/home/social_sharing_image.png",
    },
    {
      "title": "Beyond the Stars",
      "duration": "48m left",
      "progress": 0.40,
      "image": "assets/images/home/stream_original1.png",
    },
    {
      "title": "Eclipse Protocol",
      "duration": "32m left",
      "progress": 0.75,
      "image": "assets/images/home/stream_original2.png",
    },
  ];

  final List<Map<String, dynamic>> _recommendedAi = [
    {
      "title": "Blade Runner 2049",
      "genre": "Sci-Fi • Thriller",
      "rating": 8.9,
      "duration": "2h 44m",
      "image": "assets/images/home/social_sharing_image.png",
    },
    {
      "title": "Inception",
      "genre": "Sci-Fi • Mystery",
      "rating": 8.8,
      "duration": "2h 28m",
      "image": "assets/images/home/stream_original1.png",
    },
    {
      "title": "The Matrix",
      "genre": "Action • Sci-Fi",
      "rating": 9.0,
      "duration": "2h 16m",
      "image": "assets/images/home/stream_original2.png",
    },
    {
      "title": "Interstellar",
      "genre": "Sci-Fi • Adventure",
      "rating": 8.7,
      "duration": "2h 49m",
      "image": "assets/images/home/tv_show_image1.png",
    },
  ];

  final List<Map<String, dynamic>> _top10ThisWeek = [
    {
      "rank": 1,
      "title": "Cyberpunk 2099",
      "rating": 9.2,
      "image": "assets/images/home/stream_original1.png",
    },
    {
      "rank": 2,
      "title": "The Last Sentinel",
      "rating": 8.7,
      "image": "assets/images/home/social_sharing_image.png",
    },
    {
      "rank": 3,
      "title": "Eclipse Protocol",
      "rating": 9.1,
      "image": "assets/images/home/stream_original2.png",
    },
    {
      "rank": 4,
      "title": "Beyond the Stars",
      "rating": 8.6,
      "image": "assets/images/home/tv_show_image1.png",
    },
    {
      "rank": 5,
      "title": "The Dark Knight",
      "rating": 9.0,
      "image": "assets/images/home/tv_show_image2.png",
    },
  ];

  final List<Map<String, dynamic>> _newReleases = [
    {
      "title": "Dark Matter",
      "genre": "Sci-Fi • 2025",
      "rating": 8.8,
      "duration": "2h 10m",
      "image": "assets/images/home/stream_original1.png",
    },
    {
      "title": "Echoes of Tomorrow",
      "genre": "Action • 2025",
      "rating": 8.5,
      "duration": "1h 55m",
      "image": "assets/images/home/social_sharing_image.png",
    },
    {
      "title": "Silent Planet",
      "genre": "Thriller • 2025",
      "rating": 8.9,
      "duration": "2h 04m",
      "image": "assets/images/home/stream_original2.png",
    },
    {
      "title": "Neon Requiem",
      "genre": "Sci-Fi • 2025",
      "rating": 8.6,
      "duration": "1h 48m",
      "image": "assets/images/home/tv_show_image1.png",
    },
    {
      "title": "Rise of Orion",
      "genre": "Adventure • 2025",
      "rating": 8.7,
      "duration": "2h 18m",
      "image": "assets/images/home/tv_show_image2.png",
    },
  ];

  final List<Map<String, dynamic>> _genresList = [
    {"name": "Sci-Fi", "icon": "👽"},
    {"name": "Action", "icon": "🚀"},
    {"name": "Thriller", "icon": "🎯"},
    {"name": "Horror", "icon": "👻"},
    {"name": "Drama", "icon": "🎭"},
    {"name": "Comedy", "icon": "😄"},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 1. Top App Header Bar (RiStream Title & Subtitle)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "RiStream",
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                        Text(
                          "Unlimited Cinema Experience",
                          style: GoogleFonts.poppins(
                            color: AppColors.accentNeon,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Notification Icon
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Stack(
                        children: [
                          Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: 20.r,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8.r,
                              height: 8.r,
                              decoration: const BoxDecoration(
                                color: AppColors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    // Profile Avatar
                    Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.accentNeon],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: AppColors.darkBg,
                        child: Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. Search Input Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: AppColors.cardDark,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.glassBorder),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 13.sp),
                    decoration: InputDecoration(
                      icon: Icon(Icons.search_rounded, color: AppColors.secondaryText, size: 20.r),
                      hintText: "Search movies, genres, actors...",
                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.secondaryText,
                        fontSize: 13.sp,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.mic_none_rounded, color: AppColors.accentNeon, size: 20.r),
                    ),
                  ),
                ),
              ),
            ),

            // 3. Ask AI What to Watch Banner
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(color: AppColors.accentNeon.withOpacity(0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.18),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.accentNeon],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 18.r),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ask AI what to watch",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Get movies & shows recommendation",
                            style: GoogleFonts.poppins(
                              color: AppColors.secondaryText,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18.r),
                  ],
                ),
              ),
            ),

            // 4. Hero Banner Card Slider
            SliverToBoxAdapter(
              child: Container(
                height: 380.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                child: Stack(
                  children: [
                    // Backdrop Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Image.asset(
                        "assets/images/home/stream_original1.png",
                        height: 380.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 380.h,
                          color: AppColors.cardDark,
                        ),
                      ),
                    ),
                    // Dark Gradient Overlay
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                            AppColors.darkBg.withOpacity(0.85),
                            AppColors.darkBg,
                          ],
                          stops: const [0.0, 0.35, 0.75, 1.0],
                        ),
                      ),
                    ),
                    // Top Rating & HD Badges
                    Positioned(
                      top: 16.h,
                      left: 16.w,
                      right: 16.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: AppColors.glassBorder),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_rounded, color: AppColors.ratingStar, size: 16.r),
                                SizedBox(width: 4.w),
                                Text(
                                  "9.2",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [AppColors.primary, AppColors.accentNeon],
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              "ULTRA HD 4K",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bottom Banner Content
                    Positioned(
                      bottom: 20.h,
                      left: 20.w,
                      right: 20.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Sci-Fi • Action • Thriller",
                            style: GoogleFonts.poppins(
                              color: AppColors.accentNeon,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Cyberpunk 2099: Neon City",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "In a future ruled by AI and corporations, a hacker discovers a conspiracy that could change everything.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 11.sp,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // Dots Indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                width: index == 0 ? 14.w : 6.w,
                                height: 6.h,
                                decoration: BoxDecoration(
                                  color: index == 0 ? AppColors.accentNeon : Colors.white30,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.h),
                          // Action Buttons
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Get.toNamed(ContentDetailsView.routeName);
                                  },
                                  icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                                  label: Text(
                                    "Watch Now",
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
                              SizedBox(width: 12.w),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.surfaceGlass,
                                    borderRadius: BorderRadius.circular(14.r),
                                    border: Border.all(color: AppColors.glassBorder),
                                  ),
                                  child: TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_rounded, color: Colors.white, size: 18),
                                    label: Text(
                                      "Watchlist",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 5. Category Filter Tabs (🔥 Trending, 🎬 Movies, 📺 TV Series, 🎛️ Genres)
            SliverToBoxAdapter(
              child: SizedBox(
                height: 42.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedCategoryIndex == index;
                    final cat = _categories[index];
                    return GestureDetector(
                      onTap: () => setState(() => _selectedCategoryIndex = index),
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? const LinearGradient(
                                  colors: [AppColors.primary, AppColors.accentNeon],
                                )
                              : null,
                          color: isSelected ? null : AppColors.cardDark,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: isSelected ? AppColors.accentNeon : AppColors.glassBorder,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            cat["name"],
                            style: GoogleFonts.poppins(
                              color: isSelected ? Colors.white : AppColors.secondaryText,
                              fontSize: 12.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // 6. Section 1: "Continue Watching"
            SliverToBoxAdapter(
              child: _buildSectionHeader("Continue Watching"),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 175.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: _continueWatching.length,
                  itemBuilder: (context, index) {
                    final item = _continueWatching[index];
                    return ContinueWatchingWidget(
                      title: item["title"],
                      durationLeft: item["duration"],
                      progressPercent: item["progress"],
                      imagePath: item["image"],
                      onTap: () {
                        Get.toNamed(ContentDetailsView.routeName);
                      },
                    );
                  },
                ),
              ),
            ),

            // 7. Section 2: "✨ Recommended For You AI"
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "✨ Recommended For You",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "AI",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: 245.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: _recommendedAi.length,
                  itemBuilder: (context, index) {
                    final item = _recommendedAi[index];
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

            // 8. Section 3: "Top 10 This Week"
            SliverToBoxAdapter(
              child: _buildSectionHeader("Top 10 This Week"),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 210.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: _top10ThisWeek.length,
                  itemBuilder: (context, index) {
                    final item = _top10ThisWeek[index];
                    return Top10RankWidget(
                      rank: item["rank"],
                      title: item["title"],
                      rating: (item["rating"] as num).toDouble(),
                      imagePath: item["image"],
                      onTap: () {
                        Get.toNamed(ContentDetailsView.routeName);
                      },
                    );
                  },
                ),
              ),
            ),

            // 9. Section 4: "New Releases"
            SliverToBoxAdapter(
              child: _buildSectionHeader("New Releases"),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 245.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: _newReleases.length,
                  itemBuilder: (context, index) {
                    final item = _newReleases[index];
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
                        // NEW Badge Tag Overlay
                        Positioned(
                          top: 8.h,
                          left: 8.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [AppColors.primary, AppColors.accentNeon],
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              "NEW",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // 10. Section 5: "Genres"
            SliverToBoxAdapter(
              child: _buildSectionHeader("Genres"),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 45.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: _genresList.length,
                  itemBuilder: (context, index) {
                    final genre = _genresList[index];
                    return Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Row(
                        children: [
                          Text(genre["icon"], style: TextStyle(fontSize: 14.sp)),
                          SizedBox(width: 6.w),
                          Text(
                            genre["name"],
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
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
    );
  }
}