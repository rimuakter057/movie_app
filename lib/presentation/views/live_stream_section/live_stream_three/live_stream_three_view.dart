import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/views/live_stream_section/data/list/live_data_list.dart';
import 'package:movie_app/presentation/views/live_stream_section/live_stream_three/live_short_view.dart';
import 'package:movie_app/presentation/widgets/category_pill_widget.dart';

class LiveStreamThreeView extends StatefulWidget {
  const LiveStreamThreeView({super.key});
  static String routeName = "/live_stream_three_view";

  @override
  State<LiveStreamThreeView> createState() => _LiveStreamThreeViewState();
}

class _LiveStreamThreeViewState extends State<LiveStreamThreeView> {
  final TextEditingController _searchController = TextEditingController();

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
            // Top App Bar Header
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 10.r,
                              height: 10.r,
                              decoration: const BoxDecoration(
                                color: AppColors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Cinema Live",
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Watch live movie watch parties & streams",
                          style: GoogleFonts.poppins(
                            color: AppColors.secondaryText,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: AppColors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.red.withOpacity(0.6)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.sensors_rounded, color: AppColors.red, size: 14.r),
                          SizedBox(width: 4.w),
                          Text(
                            "14.8K Live",
                            style: GoogleFonts.poppins(
                              color: AppColors.red,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Search Bar Input
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
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
                      hintText: "Search streamer, topic or movie room...",
                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.secondaryText,
                        fontSize: 13.sp,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            // Category Filter Pills
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: const CategoryPillWidget(
                  categories: [
                    '🔴 All Streams',
                    '🎬 Movie Premiere',
                    '🎮 Gaming Party',
                    '🍿 Anime Lounge',
                    '🎵 Concerts',
                  ],
                ),
              ),
            ),

            // Section Header Title
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Text(
                  "Featured Live Streams",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Live Streams Grid
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.w,
                  childAspectRatio: 0.72,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = liveDataList[index % liveDataList.length];
                    final String streamerName = item['name'] ?? "Streamer #${index + 1}";
                    final String liveImage = item['liveImage'] ?? "assets/images/home/social_sharing_image.png";

                    return GestureDetector(
                      onTap: () {
                        Get.to(() => LiveShortsView());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.cardDark,
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: AppColors.glassBorder, width: 0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Live Stream Poster Thumbnail
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
                                  child: Image.asset(
                                    liveImage,
                                    height: 155.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      height: 155.h,
                                      color: AppColors.surfaceGlass,
                                      child: const Icon(Icons.live_tv_rounded, color: Colors.white24, size: 40),
                                    ),
                                  ),
                                ),
                                // LIVE Badge Overlay
                                Positioned(
                                  top: 8.h,
                                  left: 8.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.circle, color: Colors.white, size: 6.r),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "LIVE",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Viewer Count Tag
                                Positioned(
                                  bottom: 8.h,
                                  right: 8.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(color: AppColors.glassBorder),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.visibility_rounded, color: Colors.white, size: 12.r),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "${(index + 1) * 2.4}k",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Streamer Info Footer
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 14.r,
                                    backgroundColor: AppColors.primary,
                                    child: Icon(Icons.person_rounded, color: Colors.white, size: 14.r),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          streamerName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "Watch Party #${index + 1}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            color: AppColors.secondaryText,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: liveDataList.length * 2,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(height: 90.h),
            ),
          ],
        ),
      ),
    );
  }
}
