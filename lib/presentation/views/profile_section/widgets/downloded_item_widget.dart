import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../widgets/assets_icon_image.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/image_container_widget.dart';
import '../../home_section/social_sharing/widget/outline_container_widget.dart';

class DownloadedItemWidget extends StatelessWidget {
  const DownloadedItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading:ImageContainer(image: AssetsPath.tvImage1),
      title: Text("Lightyear",style: AppTextStyle.commonStyle.copyWith(
          fontSize: 14.sp
      ),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Jan 13th",style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 12.sp,color: Color(0xFFE0E0E0)),),
          CustomContainer(
            height: 24.h,
            width: 56.w,
            child: Text("1.2 GB",style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 12.sp),),
          ),

        ],
      ),
      trailing: OutlineContainerWidget(
        color: AppColors.red,
        height: 32.h,
        width: 72.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete,color: AppColors.red,size: 16.sp,),
            SizedBox(width: 6.w,),
            Text("Delete", style: AppTextStyle.commonStyle.copyWith(
                fontSize: 12.sp,color: AppColors.red),),
          ],
        ),
      ),

      // CustomContainer(
      //   backgroundColor: AppColors.primary,
      //   width: AppSizes.watchWidthButton,
      //   child: Center(
      //     child: Row(
      //       children: [
      //         Icon(Icons.delete,color: Colors.white,size: 16.sp,),
      //         Text("Delete", style: AppTextStyle.commonStyle.copyWith(fontSize: 12.sp),),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}