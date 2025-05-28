import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'live_view_widget.dart';

class LiveVideoWidget extends StatelessWidget {
  const LiveVideoWidget({
    super.key, required this.image, required this.title1, required this.title2,
  });
  final String image;
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 172.h,
          width: 172.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8.h,
          left: 8.w,
          right: 8.w,
          child: LiveViewWidget(title1:title1, title2: title2,),
        ),
      ],
    );
  }
}