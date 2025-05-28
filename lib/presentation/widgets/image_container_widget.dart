import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,required this.image, this.width, this.height, this.borderRadius, this.child,
  });
  final String image;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 48.h,
      width:width?? 80.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(borderRadius??8.r),
      ),
      child: child,
    );
  }
}