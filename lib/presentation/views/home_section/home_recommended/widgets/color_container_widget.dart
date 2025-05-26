import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key, this.width, required this.color,
  });
  final double? width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width:width ??16.w,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}