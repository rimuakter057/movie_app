import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import 'color_container_widget.dart';

class CustomColorContainerWidget extends StatelessWidget {
  const CustomColorContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 106.w,
      child: Row(children: [
        ColorContainer(width: 26.w, color: AppColors.primary,),
        SizedBox(width: 4.w,),
        ColorContainer(color: AppColors.primaryShade1,),
        SizedBox(width: 4.w,),
        ColorContainer(color: AppColors.primaryShade2,),
        SizedBox(width: 4.w,),
        ColorContainer(color: AppColors.primaryShade2,),
        SizedBox(width: 4.w,),
        ColorContainer(color: AppColors.primaryShade,),
      ],
      ),
    );
  }
}