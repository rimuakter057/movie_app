import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../widgets/assets_icon_image.dart';

class DownloadedTextWidget extends StatelessWidget {
  const DownloadedTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Downloaded",style: AppTextStyle.commonStyle,),
        Row(
          children: [
            Text("short",style: AppTextStyle.bodyMediumStyle.copyWith(color: AppColors.secondaryText),),
            AssetsIconWidget(path: AssetsPath.dropIcon, height: 16.h, width: 16.w)
          ],
        ),
      ],
    );
  }
}