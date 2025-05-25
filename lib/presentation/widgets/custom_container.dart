import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_sizes.dart';
class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key, this.height, this.width, this.backgroundColor,
    this.child, this.borderRadius,

  });
  final double ?height;
  final double ?width;
  final Color ?backgroundColor;
  final Widget ?child;
  final double ?borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? AppSizes.commonHeight,
      width:width?? AppSizes.searchBarWidthHm,
      decoration: BoxDecoration(
        color:backgroundColor?? AppColors.searchBackground,
        borderRadius: BorderRadius.circular(borderRadius??AppSizes.commonRadius),

      ),
      child: child,
    );
  }
}