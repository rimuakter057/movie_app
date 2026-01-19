import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets_path.dart';
import '../../../../widgets/profile_row_widget.dart';
import 'live_video_widget.dart';


class GridLiveVideoItemWidget extends StatelessWidget {
  const GridLiveVideoItemWidget({
    super.key,
    required this.image,
    required this.countSee,
    required this.profileTitle,
    required this.profileSubTitle, this.column,
  });
  final String image;
  final String countSee;
  final String profileTitle;
  final String profileSubTitle;
  final Column? column;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //live video show here
        LiveVideoWidget(
          image: image,
          title1: countSee,
          title2: 'live',
        ),
        SizedBox(height: 8.h),
        //profile section
        ProfileRowWidget(
          image: AssetsPath.liveImage1,
          title: profileTitle,
          subtitle: profileSubTitle,
        ),
      ],
    );
  }
}