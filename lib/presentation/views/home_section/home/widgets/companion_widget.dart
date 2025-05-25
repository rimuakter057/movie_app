import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/assets_path.dart';

class CompanionWidget extends StatelessWidget {
  const CompanionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Image.asset(AssetsPath.textImage,height: 24.15.h,width: 48.w,),
        SizedBox(width: 8.w),
        Text("6.8/10",style: AppTextStyle.commonStyle.copyWith(fontSize: 14.sp),),
      ],),
      SizedBox(width: 8.h),
      Text("Companion",style: AppTextStyle.commonStyle),
    ],);
  }
}