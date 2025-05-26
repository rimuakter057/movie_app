import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_text_style.dart';
import '../../core/utils/assets_path.dart';
import 'assets_icon_image.dart';
import 'custom_container_circle.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleContainer(
          child:    AssetsIconWidget(path: AssetsPath.arrowIcon, height: 24.h, width: 24.w),
        ),
        Text("Profile",style: AppTextStyle.commonStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600
        ),),
        AssetsIconWidget(path: AssetsPath.searchIcon, height: 24.h, width: 24.w),
      ],
    );
  }
}