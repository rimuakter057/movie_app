import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_text_style.dart';
import 'package:movie_app/core/utils/assets_path.dart';
import 'package:movie_app/presentation/widgets/assets_icon_image.dart';

void showShareBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,

    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFF1E062D),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
        height: 331,
        child: Padding(
          padding:  EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Share To',
                style: AppTextStyle.commonStyle.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 10),
              Divider(color: AppColors.primary),
              SizedBox(height: 20),

              // Row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSocialItem(AssetsPath.whatsAppIcon, "WhatsApp"),
                  _buildSocialItem(AssetsPath.facebookIcon, "Facebook"),
                  _buildSocialItem(AssetsPath.instagramIcon, "Instagram"),
                  _buildSocialItem(AssetsPath.ticTokIcon, "TikTok"),
                ],
              ),
              SizedBox(height: 24.h),

              // Row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSocialItem(AssetsPath.twitterIcon, "Twitter"),
                  _buildSocialItem(AssetsPath.linkedInIcon, "LinkedIn"),
                  _buildSocialItem(AssetsPath.messengerIcon, "Messenger"),
                  _buildSocialItem(AssetsPath.copyIcon, "Copy Url"),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


Widget _buildSocialItem(String path, String text) {
  return SizedBox(
    height: 70.h,
    width: 70.w,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 46.h,width: 46.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: AssetsIconWidget(path: path, height: 24.h, width: 24.w),
        ),

        SizedBox(height: 8.h),
        Expanded(child: Text(text,style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 12.sp,)),
        )],
    ),
  );
}
