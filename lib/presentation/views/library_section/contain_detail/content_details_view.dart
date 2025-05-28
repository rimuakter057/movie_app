import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/core/utils/app_text_style.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/widget/body_text_widget.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/widget/header_container.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/widget/hip_hop_row_widget.dart';
import 'package:movie_app/presentation/widgets/assets_icon_image.dart';
import 'package:movie_app/presentation/widgets/custom_shear_row.dart';
import 'package:movie_app/presentation/widgets/image_container_widget.dart';
import 'package:movie_app/presentation/widgets/profile_row_widget.dart';
import 'package:movie_app/presentation/widgets/profile_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../widgets/category_headline_row_text.dart';
import '../../../widgets/custom_container.dart';
import '../../profile_section/widgets/downloded_item_widget.dart';
import '../../profile_section/widgets/list_tile_widget.dart';
import '../common_widgets/categories_item_widget.dart';
import '../content_library/content_library_view.dart';

class ContentDetailsView extends StatefulWidget {
  const ContentDetailsView({super.key});

  @override
  State<ContentDetailsView> createState() => _ContentDetailsViewState();
}

class _ContentDetailsViewState extends State<ContentDetailsView> {
  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: 16.h);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header container
            HeaderContainer(),
            SizedBox(height: 24.h),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hip Hop Road Redemption",
                      style: AppTextStyle.commonStyle.copyWith(fontSize: 22),
                    ),
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
                          AssetsIconWidget(
                            path: AssetsPath.playIcon,
                            height: 16.67.h,
                            width: 16.67.w,
                          ),
                          SizedBox(width: 8.w),
                          Text("Play", style: AppTextStyle.commonStyle),
                        ],
                      ),
                    ),
                    gap,
                    // Genre: Drama Music, Action text
                    Text(
                      "Genre: Drama Music, Action",
                      style: AppTextStyle.bodyMediumStyle.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    gap,
                    //Synopsis text
                    Text(
                      "Synopsis",
                      style: AppTextStyle.bodyMediumStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    gap,

                    ///body text
                    ExpandableTextWidget(),
                    gap,
                    CategoryItemsWidget(
                      boxHeight: 48.h,
                      returnWidget: ProfileRowWidget(
                        image: AssetsPath.tvImage1,
                        title: "Michael Carter",
                        subtitle: "subtitle",
                      ),
                    ),
                    CategoryHeadlineRowText(titleText: 'New & Popular'),
                    gap,
                    CategoryItemsWidget(
                      boxHeight: 148.h,
                      image: AssetsPath.tvImage1,
                      child: Text(
                        "new",
                        style: AppTextStyle.bodyMediumStyle.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 358.h,
                      child: ListView.builder(

                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            //DownloadedItem
                            child:SizedBox(

                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading:ImageContainer(image: AssetsPath.tvImage1),
                                title: Text("Lightyear",style: AppTextStyle.commonStyle.copyWith(
                                    fontSize: 14.sp
                                ),),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Jan 13th",style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 12.sp,color: Color(0xFFE0E0E0)),),
                                    CustomContainer(
                                      height: 24.h,
                                      width: 56.w,
                                      child: Text("1.2 GB",style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 12.sp),),
                                    ),

                                  ],
                                ),



                              ),
                            ),
                          );
                        },
                      ),
                    ),



                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
