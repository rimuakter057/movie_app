import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/views/live_stream_section/live_stream_three/widgets/live_video_item_widget.dart';

import 'package:movie_app/presentation/widgets/custom_container.dart';
import 'package:movie_app/presentation/widgets/custom_search_bar.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_path.dart';


class LiveStreamThreeView extends StatefulWidget {
  const LiveStreamThreeView({super.key});

  @override
  State<LiveStreamThreeView> createState() => _LiveStreamThreeViewState();
}

class _LiveStreamThreeViewState extends State<LiveStreamThreeView> {
  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: 16.h);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(top: 16.h,
          left: 16.w,
            right: 16.w
          ),
          child: Column(
            children: [
              CustomSearchBar(),
              gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(
                    backgroundColor: AppColors.primary15,
                    height: 34.h,
                    width: 117.w,
                    child: Text(
                      "all",
                      style: AppTextStyle.bodyMediumStyle.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  CustomContainer(
                    height: 34.h,
                    width: 117.w,
                    backgroundColor: AppColors.black,
                    child: Text("Popular", style: AppTextStyle.bodyMediumStyle),
                  ),
                  CustomContainer(
                    height: 34.h,
                    width: 117.w,
                    backgroundColor: AppColors.black,
                    child: Text(
                      "Following",
                      style: AppTextStyle.bodyMediumStyle,
                    ),
                  ),
                ],
              ),
              gap,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ongoing Live Stream",
                        style: AppTextStyle.commonStyle.copyWith(fontSize: 18.sp),
                      ),
                      gap,
                      GridView.builder(
                        itemCount: 20,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing:20.h,
                           crossAxisSpacing: 4.w,
                          ) ,
                          itemBuilder: (context,index){
                            return FittedBox(
                              child: GridLiveVideoItemWidget(
                                image:AssetsPath.liveImage1,
                                countSee: '1M',
                                profileTitle: 'Bradley Lawlor',
                                profileSubTitle: '10k Followers',
                              ),
                            );
                          }),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


