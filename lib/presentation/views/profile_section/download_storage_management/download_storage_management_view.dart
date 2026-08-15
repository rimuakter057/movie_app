import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets_path.dart';
import 'package:movie_app/domain/entities/download_storage_entities.dart';
import 'package:movie_app/presentation/controller/download_storage_controller.dart';
import 'package:movie_app/presentation/views/profile_section/subscription_plan_view.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DownloadStorageManagementView extends StatefulWidget {
  const DownloadStorageManagementView({super.key});
  static const routeName = '/download-storage-management';

  @override
  State<DownloadStorageManagementView> createState() =>
      _DownloadStorageManagementViewState();
}

class _DownloadStorageManagementViewState
    extends State<DownloadStorageManagementView> {
  late final DownloadStorageController controller;
  bool _cloudSync = true;
  bool _autoDelete = false;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DownloadStorageController>();
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26.r,
                      backgroundColor: AppColors.primary,
                      child: ClipOval(
                        child: Image.asset(
                          AssetsPath.liveImage1,
                          height: 48.r,
                          width: 48.r,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => CircleAvatar(
                            radius: 24.r,
                            backgroundColor: AppColors.cardDark,
                            child: Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                              size: 28.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alex Morgan",
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "VIP Premium Streaming",
                          style: GoogleFonts.poppins(
                            color: AppColors.accentNeon,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(SubscriptionPlanView.routeName);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.accentNeon],
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 16.r),
                            SizedBox(width: 4.w),
                            Text(
                              "VIP Plans",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Storage Indicator Glass Card
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: AppColors.glassBorder),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.15),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 65.0.r,
                      lineWidth: 12.0.r,
                      percent: 0.68,
                      animation: true,
                      animationDuration: 1200,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "68%",
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Used",
                            style: GoogleFonts.poppins(
                              color: AppColors.secondaryText,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppColors.accentNeon,
                      backgroundColor: AppColors.surfaceGlass,
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStorageInfoTile("Downloaded", "42.8 GB", AppColors.primary),
                        Container(width: 1, height: 30.h, color: AppColors.glassBorder),
                        _buildStorageInfoTile("Free Storage", "20.2 GB", AppColors.greenLive),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Downloaded Content Title
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h, bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Downloaded Media",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "3 Items",
                      style: GoogleFonts.poppins(
                        color: AppColors.secondaryText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Downloaded Items List
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: FutureBuilder<List<DownloadStorageEntity>>(
                  future: controller.getDownloadStorageFuture(),
                  builder: (context, snapshot) {
                    final items = snapshot.data ?? [];
                    if (items.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Center(
                          child: Text(
                            "No downloaded media",
                            style: GoogleFonts.poppins(color: AppColors.secondaryText),
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      separatorBuilder: (context, index) => SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            color: AppColors.cardDark,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: AppColors.glassBorder),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.asset(
                                  AssetsPath.tvImage1,
                                  height: 50.h,
                                  width: 65.w,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    height: 50.h,
                                    width: 65.w,
                                    color: AppColors.surfaceGlass,
                                    child: const Icon(Icons.movie_rounded, color: Colors.white30),
                                  ),
                                ),
                              ),
                              SizedBox(width: 14.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      "${item.subtitle} • ${item.dataSize}",
                                      style: GoogleFonts.poppins(
                                        color: AppColors.secondaryText,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_outline_rounded, color: AppColors.red, size: 20.r),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

            // Storage Settings Switches & Bulk Delete Button
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      value: _cloudSync,
                      onChanged: (val) => setState(() => _cloudSync = val),
                      activeColor: AppColors.accentNeon,
                      title: Text(
                        "Cloud Sync Backup",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Auto backup watchlist to cloud",
                        style: GoogleFonts.poppins(color: AppColors.secondaryText, fontSize: 11.sp),
                      ),
                    ),
                    Divider(color: AppColors.glassBorder),
                    SwitchListTile(
                      value: _autoDelete,
                      onChanged: (val) => setState(() => _autoDelete = val),
                      activeColor: AppColors.accentNeon,
                      title: Text(
                        "Auto-Delete Low Storage",
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Clear old episodes when storage < 10%",
                        style: GoogleFonts.poppins(color: AppColors.secondaryText, fontSize: 11.sp),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.snackbar(
                            "Downloads",
                            "All downloaded items cleared",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppColors.cardDark,
                            colorText: Colors.white,
                          );
                        },
                        icon: const Icon(Icons.delete_forever_rounded, color: Colors.white),
                        label: Text(
                          "Bulk Delete Downloads",
                          style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(height: 80.h),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorageInfoTile(String title, String size, Color color) {
    return Column(
      children: [
        Row(
          children: [
            Container(width: 8.r, height: 8.r, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            SizedBox(width: 6.w),
            Text(title, style: GoogleFonts.poppins(color: AppColors.secondaryText, fontSize: 11.sp)),
          ],
        ),
        SizedBox(height: 4.h),
        Text(size, style: GoogleFonts.poppins(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}