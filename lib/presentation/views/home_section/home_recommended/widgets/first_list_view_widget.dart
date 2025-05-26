import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,required this.image, this.width, this.height, this.borderRadius,
  });
  final String image;
  final double? width;
  final double? height;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Container(
        height:height?? 48.h,
        width:width?? 80.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(borderRadius??8.r),
        ),
      ),
    );
  }
}