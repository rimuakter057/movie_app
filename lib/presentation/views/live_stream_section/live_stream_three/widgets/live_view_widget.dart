import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../widgets/assets_icon_image.dart';
import '../../../../widgets/custom_container.dart';

class LiveViewWidget extends StatelessWidget {
  const LiveViewWidget({
    super.key, required this.title1, required this.title2,
  });
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 156.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomContainer(
            borderRadius: 3.r,
            height: 16.h,
            width: 37.w,
            backgroundColor: AppColors.black30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetsIconWidget(
                  path: AssetsPath.eyeIcon,
                  height: 7.15.h,
                  width: 12.w,
                ),
                Text(
                  title1,
                  style: AppTextStyle.commonStyle.copyWith(
                    fontSize: 8.sp,
                  ),
                ),
              ],
            ),
          ),
          CustomContainer(
            borderRadius: 3.r,
            height: 16.h,
            width: 37.w,
            backgroundColor: AppColors.black30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 6.h,
                  width: 6.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  title2,
                  style: AppTextStyle.commonStyle.copyWith(
                    fontSize: 8.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}