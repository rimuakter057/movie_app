import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_text_style.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing_button/widget/body_text_widget.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing_button/widget/header_container.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing_button/widget/hip_hop_row_widget.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing_button/widget/outline_container_widget.dart';
import 'package:movie_app/presentation/widgets/assets_icon_image.dart';
import 'package:movie_app/presentation/widgets/custom_shear_row.dart';


import '../../../../core/utils/assets_path.dart';


class SocialShearingButtonView extends StatefulWidget {
  const SocialShearingButtonView({super.key});

  @override
  State<SocialShearingButtonView> createState() => _SocialShearingButtonViewState();
}

class _SocialShearingButtonViewState extends State<SocialShearingButtonView> {
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
                  CustomShearRow(),
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





