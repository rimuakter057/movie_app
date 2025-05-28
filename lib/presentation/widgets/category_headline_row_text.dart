import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';

class CategoryHeadlineRowText extends StatelessWidget {
  const CategoryHeadlineRowText({
    super.key,
    required this.titleText,
    this.textView,
  });

  final String titleText;
  final String? textView;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleText,style: AppTextStyle.commonStyle.copyWith(fontSize: 22.sp),),
        Text(textView??"View All",style: AppTextStyle.bodyMediumStyle.copyWith(fontWeight: FontWeight.w500,color: AppColors.primary),),

      ],
    );
  }
}