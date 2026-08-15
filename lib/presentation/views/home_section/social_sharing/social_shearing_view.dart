import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets_path.dart';

class SocialShearingView extends StatefulWidget {
  const SocialShearingView({super.key});
  static const String routeName = "/social_shearing_view";

  @override
  State<SocialShearingView> createState() => _SocialShearingViewState();
}

class _SocialShearingViewState extends State<SocialShearingView> {
  final TextEditingController _reviewController = TextEditingController();

  final List<Map<String, dynamic>> _communityReviews = [
    {
      "user": "Marcus Vance",
      "avatar": "assets/images/home/tv_show_image1.png",
      "time": "10 mins ago",
      "movie": "Cyberpunk 2099: Neon City",
      "rating": 5.0,
      "comment": "The visual world-building and synthwave soundtrack are absolutely mind-blowing! A masterpiece of sci-fi cinema.",
      "likes": 142,
      "isLiked": false,
    },
    {
      "user": "Sophia Ray",
      "avatar": "assets/images/home/tv_show_image2.png",
      "time": "1 hour ago",
      "movie": "Hip Hop Road Redemption",
      "rating": 4.5,
      "comment": "Incredible music documentary! Loved the behind-the-scenes studio sessions and raw storytelling.",
      "likes": 98,
      "isLiked": true,
    },
    {
      "user": "David Miller",
      "avatar": "assets/images/home/first_home_image1.png",
      "time": "3 hours ago",
      "movie": "Shadow of the Dragon",
      "rating": 4.8,
      "comment": "Best fantasy release of the year. The climax fight scene in episode 4 had me on the edge of my seat!",
      "likes": 215,
      "isLiked": false,
    },
  ];

  @override
  void dispose() {
    _reviewController.dispose();
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
            // Top App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cinema Social",
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Community reviews, discussions & ratings",
                          style: GoogleFonts.poppins(
                            color: AppColors.secondaryText,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Icon(Icons.forum_rounded, color: AppColors.accentNeon, size: 20.r),
                    ),
                  ],
                ),
              ),
            ),

            // Share / Write Review Box
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18.r,
                          backgroundColor: AppColors.primary,
                          child: Icon(Icons.person_rounded, color: Colors.white, size: 20.r),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextField(
                            controller: _reviewController,
                            style: GoogleFonts.poppins(color: Colors.white, fontSize: 13.sp),
                            decoration: InputDecoration(
                              hintText: "Write a movie review or thought...",
                              hintStyle: GoogleFonts.poppins(
                                color: AppColors.secondaryText,
                                fontSize: 13.sp,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star_rounded,
                              color: AppColors.ratingStar,
                              size: 18.r,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_reviewController.text.trim().isNotEmpty) {
                              setState(() {
                                _communityReviews.insert(0, {
                                  "user": "You",
                                  "avatar": AssetsPath.liveImage1,
                                  "time": "Just now",
                                  "movie": "Cyberpunk 2099",
                                  "rating": 5.0,
                                  "comment": _reviewController.text,
                                  "likes": 1,
                                  "isLiked": true,
                                });
                                _reviewController.clear();
                              });
                            }
                          },
                          icon: const Icon(Icons.send_rounded, color: Colors.white, size: 16),
                          label: Text(
                            "Post Review",
                            style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Community Reviews Feed Title
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h, bottom: 8.h),
                child: Text(
                  "Recent Community Discussions",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Reviews List
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final review = _communityReviews[index];
                    final bool isLiked = review["isLiked"] as bool;

                    return Container(
                      margin: EdgeInsets.only(bottom: 14.h),
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 18.r,
                                backgroundColor: AppColors.primary,
                                child: Icon(Icons.person_rounded, color: Colors.white, size: 20.r),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review["user"],
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    review["time"],
                                    style: GoogleFonts.poppins(
                                      color: AppColors.secondaryText,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceGlass,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(color: AppColors.glassBorder),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star_rounded, color: AppColors.ratingStar, size: 14.r),
                                    SizedBox(width: 4.w),
                                    Text(
                                      review["rating"].toString(),
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Reviewed: ${review["movie"]}",
                            style: GoogleFonts.poppins(
                              color: AppColors.accentNeon,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            review["comment"],
                            style: GoogleFonts.poppins(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 12.sp,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    review["isLiked"] = !isLiked;
                                    review["likes"] = isLiked ? (review["likes"] as int) - 1 : (review["likes"] as int) + 1;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                      color: isLiked ? AppColors.red : AppColors.secondaryText,
                                      size: 18.r,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "${review["likes"]}",
                                      style: GoogleFonts.poppins(
                                        color: isLiked ? AppColors.red : AppColors.secondaryText,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Row(
                                children: [
                                  Icon(Icons.chat_bubble_outline_rounded, color: AppColors.secondaryText, size: 16.r),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "Reply",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.secondaryText,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(Icons.share_outlined, color: AppColors.secondaryText, size: 18.r),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: _communityReviews.length,
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
