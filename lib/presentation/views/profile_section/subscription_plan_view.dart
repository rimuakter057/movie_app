import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class SubscriptionPlanView extends StatefulWidget {
  const SubscriptionPlanView({super.key});
  static const routeName = '/subscription-plan';

  @override
  State<SubscriptionPlanView> createState() => _SubscriptionPlanViewState();
}

class _SubscriptionPlanViewState extends State<SubscriptionPlanView> {
  int _selectedPlan = 1; // Default selected Ultra HD VIP
  bool _isAnnual = true;

  final List<Map<String, dynamic>> _plans = [
    {
      "name": "Standard HD",
      "price": "\$9.99",
      "annualPrice": "\$7.99",
      "quality": "1080p Full HD",
      "screens": "1 Device at a time",
      "features": ["Ad-Supported Streaming", "HD Video Quality", "Cancel Anytime"],
      "color": AppColors.cardDark,
    },
    {
      "name": "Ultra HD VIP 4K",
      "price": "\$15.99",
      "annualPrice": "\$11.99",
      "quality": "4K Ultra HD + HDR",
      "screens": "4 Devices simultaneously",
      "isBest": true,
      "features": [
        "100% Ad-Free Streaming",
        "Dolby Atmos Spatial Audio",
        "Unlimited Offline Downloads",
        "Exclusive VIP Early Access",
      ],
      "color": AppColors.primary,
    },
    {
      "name": "Family Pass",
      "price": "\$22.99",
      "annualPrice": "\$17.99",
      "quality": "4K Ultra HD + HDR",
      "screens": "6 Profiles & Devices",
      "features": [
        "Parental Controls",
        "6 Independent User Profiles",
        "Unlimited Offline Downloads",
        "Priority Customer Support",
      ],
      "color": AppColors.cardDark,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          "Choose VIP Plan",
          style: GoogleFonts.outfit(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Badge & Title
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.accentNeon],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  "STREAMLY VIP MEMBERSHIP",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Unlock Unlimited Cinema & 4K Streaming",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "Cancel or switch your plan anytime with no extra fees.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: AppColors.secondaryText,
                  fontSize: 12.sp,
                ),
              ),

              SizedBox(height: 20.h),

              // Monthly vs Annual Toggle
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: AppColors.cardDark,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _isAnnual = false),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: !_isAnnual ? AppColors.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          "Monthly",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _isAnnual = true),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          gradient: _isAnnual
                              ? const LinearGradient(
                                  colors: [AppColors.primary, AppColors.accentNeon],
                                )
                              : null,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Yearly",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                "SAVE 30%",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Plan Cards List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _plans.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final plan = _plans[index];
                  final isSelected = _selectedPlan == index;
                  final isBest = plan["isBest"] == true;
                  final displayPrice = _isAnnual ? plan["annualPrice"] : plan["price"];

                  return GestureDetector(
                    onTap: () => setState(() => _selectedPlan = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.cardDark : AppColors.cardDark.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: isSelected ? AppColors.accentNeon : AppColors.glassBorder,
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 16,
                                  spreadRadius: 2,
                                ),
                              ]
                            : null,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plan["name"],
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    plan["quality"],
                                    style: GoogleFonts.poppins(
                                      color: AppColors.accentNeon,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    displayPrice,
                                    style: GoogleFonts.outfit(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "/mo",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.secondaryText,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (isBest) ...[
                            SizedBox(height: 10.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: AppColors.primary),
                              ),
                              child: Text(
                                "MOST POPULAR CHOICE",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          SizedBox(height: 14.h),
                          Divider(color: AppColors.glassBorder),
                          SizedBox(height: 10.h),
                          ...((plan["features"] as List<String>).map((feat) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 6.h),
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle_rounded, color: AppColors.accentNeon, size: 16.r),
                                  SizedBox(width: 8.w),
                                  Text(
                                    feat,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList()),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 24.h),

              // Upgrade Button CTA
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      "Streamly VIP",
                      "Welcome to Streamly Ultra HD VIP!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.cardDark,
                      colorText: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: AppColors.primary,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    "Activate Streamly VIP Now",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
