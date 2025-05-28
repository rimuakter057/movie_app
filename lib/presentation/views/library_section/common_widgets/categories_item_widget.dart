/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/image_container_widget.dart';

class CategoryItemsWidget extends StatelessWidget {
  const CategoryItemsWidget({
    super.key,
   required this.image,
    this.imageHeight,
    this.width,
    this.boxHeight,
    this.child, this.returnWidget,
  });
  final String image;
  final double? boxHeight;
  final double? imageHeight;
  final double? width;
  final Widget? child;
 final Widget?returnWidget;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: boxHeight ?? 122.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return FittedBox(
            child:returnWidget?? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(
                  height: imageHeight ?? 122.h,
                  width: width ?? 96.w,
                  image: image,
                ),
                if (child != null) child!,
              ],
            ),
          );
        },
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/image_container_widget.dart';

class CategoryItemsWidget extends StatelessWidget {
  const CategoryItemsWidget({
    super.key,
    this.image,
    this.imageHeight,
    this.width,
    this.boxHeight,
    this.child,
    this.returnWidget,
  }) : assert(
  returnWidget != null || image != null,
  'If returnWidget is not provided, image must not be null.',
  );

  final String? image;
  final double? boxHeight;
  final double? imageHeight;
  final double? width;
  final Widget? child;
  final Widget? returnWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxHeight ?? 122.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(right: 8.w),
            child: FittedBox(
              child: returnWidget ??
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageContainer(
                        height: imageHeight ?? 122.h,
                        width: width ?? 96.w,
                        image: image!,
                      ),
                      if (child != null) child!,
                    ],
                  ),
            ),
          );
        },
      ),
    );
  }
}

