import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class OutlineContainerWidget extends StatelessWidget {
  const OutlineContainerWidget({
    super.key, this.width, required this.text,
  });
  final double?width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width:width?? 56.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border:Border.all(
            color: AppColors.primary,
            width: 1.w
        ),

      ),
      child: Center(
        child: Text(text,style: AppTextStyle.commonStyle.copyWith(
            fontSize: 10.sp,
            color: AppColors.primary,
            fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}