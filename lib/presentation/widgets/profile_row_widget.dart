import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/widgets/profile_widget.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';

class ProfileRowWidget extends StatelessWidget {
  const ProfileRowWidget({
    super.key, required this.image, required this.title, required this.subtitle, this.titleStyle, this.subTitleStyle,
  });
  final String image;
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ProfileWidget(image:image ),
      SizedBox(width: 8.w,),
      Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
        Text(title,style:titleStyle?? AppTextStyle.bodyMediumStyle,),
        SizedBox(height: 4.h,),
        Text(subtitle,style:subTitleStyle?? AppTextStyle.bodyMediumStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.secondaryText
        ),),
      ],),
    ]);
  }
}