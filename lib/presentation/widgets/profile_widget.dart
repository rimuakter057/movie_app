import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key, required this.image, this.width, this.height,
  });
final String image;
final double? width;
final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 36.h,
      width:width?? 36.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image:AssetImage( image),fit: BoxFit.cover)
      ),
    );
  }
}