import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/core/utils/app_text_style.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/widget/body_text_widget.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/widget/header_container.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/widget/hip_hop_row_widget.dart';
import 'package:movie_app/presentation/widgets/assets_icon_image.dart';
import 'package:movie_app/presentation/widgets/custom_shear_row.dart';


import '../../../../core/utils/assets_path.dart';


class SocialShearingView extends StatefulWidget {
  const SocialShearingView({super.key});

  @override
  State<SocialShearingView> createState() => _SocialShearingViewState();
}

class _SocialShearingViewState extends State<SocialShearingView> {
  @override
  Widget build(BuildContext context) {
     final Widget gap = SizedBox(height: 16.h);
    return Scaffold(
      body: Column(
        children: [
          ///header container
          HeaderContainer(),
          SizedBox(height: 24.h,),
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hip Hop Road Redemption",
                    style: AppTextStyle.commonStyle.copyWith(fontSize: 22),),
                  gap,
                  ///hip hop  details row
                  HipHopRow(),
                  gap,
                  ///shearing row
                  CustomShearRow(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AssetsIconWidget(path: AssetsPath.playIcon, height: 16.67.h, width: 16.67.w),
                        SizedBox(width: 8.w,),
                        Text("Play",style: AppTextStyle.commonStyle,)
                      ],
                    ),
                  ),
                 gap,
                 // Genre: Drama Music, Action text
                  Text("Genre: Drama Music, Action",style:
                  AppTextStyle.bodyMediumStyle.copyWith(fontWeight: FontWeight.w300)
                  ),
                  gap,
                  //Synopsis text
                  Text("Synopsis",style:
                  AppTextStyle.bodyMediumStyle.copyWith(fontWeight: FontWeight.w600,
                  fontSize: 16.sp
                  )
                  ),
                  gap,
                  ///body text
                  ExpandableTextWidget(),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}





