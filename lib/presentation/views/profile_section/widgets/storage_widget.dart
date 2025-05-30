import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../widgets/assets_icon_image.dart';
import '../../../widgets/custom_container.dart';

class StorageWidget extends StatelessWidget {
  const StorageWidget({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      height: 100.h,
      backgroundColor: Color(0x407A24BC),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:16.w,vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total storage",style: AppTextStyle.bodyMediumStyle),
                Text("120 GB",style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 22),),
              ],
            ),
            AssetsIconWidget(path: AssetsPath.line, height: 100.h, width: 2.w,color: AppColors.primary,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Free storage",style: AppTextStyle.bodyMediumStyle),
                Text("68 GB",style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 22),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}