import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_sizes.dart';
import '../../core/utils/assets_path.dart';

class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({
    super.key, this.child, this.height, this.width, this.backgroundColor,
  });
  final Widget?child;
  final double?height;
  final double?width;
  final Color?backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width?? AppSizes.commonIconBackWidth,
      height:height?? AppSizes.commonHeight,
      decoration: BoxDecoration(
        color:backgroundColor?? AppColors.searchBackground,
        borderRadius: BorderRadius.circular(100.r), // Full circle
      ),
      child:child?? Stack(
        clipBehavior: Clip.none,
        children: [
          // Notification icon
          Center(
            child: Image.asset(
              AssetsPath.notificationIcon,
              height: 24.h,
              width: 24.h,
            ),
          ),

          // Badge on top-right of icon
          Positioned(
            top: 6.h,
            right: 6.w,
            child: Container(
              height: 13.h,
              width: 13.w,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}