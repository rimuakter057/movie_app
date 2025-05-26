import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class OutlineContainerWidget extends StatelessWidget {
  const OutlineContainerWidget({
    super.key, this.width,  this.text, this.child, this.height, this.color,
  });
  final double?height;
  final double?width;
  final String? text;
  final Widget?child;
  final Color?color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 24.h,
      width:width?? 56.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border:Border.all(
            color:color?? AppColors.primary,
            width: 1.w
        ),

      ),
      child: Center(
        child:child?? Text(text??"",style: AppTextStyle.commonStyle.copyWith(
            fontSize: 10.sp,
            color: AppColors.primary,
            fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}