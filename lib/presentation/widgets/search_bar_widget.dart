import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_sizes.dart';
import '../../core/utils/assets_path.dart';
import 'assets_icon_image.dart';
import 'custom_container.dart';
import 'custom_container_circle.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,

  });



  @override
  Widget build(BuildContext context) {

    final Widget gapSm =SizedBox(width: 8.w,);
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AssetsIconWidget(
                    path: AssetsPath.searchIcon,
                    height: AppSizes.searchIconHeightHm,
                    width: AppSizes.searchIconWidthHm,
                  ),
                  gapSm,
                  Expanded(
                    child: TextField(
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: AppColors.secondaryText,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: AppColors.secondaryText,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                AssetsIconWidget(
                  path: AssetsPath.line,
                  height: 20.h,
                  width: 1.w,
                ),
                gapSm,
                CustomCircleContainer(
                  height: 32.h,
                  width: 32.w,
                  backgroundColor: AppColors.micBackground,
                  child: AssetsIconWidget(
                    path: AssetsPath.microphoneIcon,
                    height: 15.h,
                    width: 21.75.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}