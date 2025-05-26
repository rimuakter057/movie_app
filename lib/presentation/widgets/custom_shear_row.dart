import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_sizes.dart';
import '../../core/utils/app_text_style.dart';
import '../../core/utils/assets_path.dart';
import '../views/home_section/social_sharing/widget/bottom_sheet_widget.dart';
import 'assets_icon_image.dart';
import 'custom_container.dart';
import 'icon_box_widget.dart';


class CustomShearRow extends StatelessWidget {
  const CustomShearRow({
    super.key, this.child,
  });
final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomContainer(
              backgroundColor: AppColors.primary,
              width: AppSizes.watchWidthButton,
              child: Center(
                child:child?? Text("Watch Now", style: AppTextStyle.commonStyle),
              ),
            ),
            SizedBox(width: 8.w,),
            AssetsIconWidget(
              path: AssetsPath.line,
              height: AppSizes.commonHeight,
              width: 1.w,
            ),
          ],
        ),
        IconBoxWidget(
          icon: AssetsPath.downloadIcon,
          iconHeight: 20.h,
          iconWidth: 20.w,
        ),
        InkWell(
            onTap: (){
              showShareBottomSheet(context);
            },
            child: IconBoxWidget(icon: AssetsPath.shearIcon)),
        IconBoxWidget(icon: AssetsPath.bookmarkIcon),
      ],
    );
  }
}