
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/widgets/first_list_view_widget.dart';
import 'package:movie_app/presentation/views/live_stream_section/live_stream_three/widgets/live_video_item_widget.dart';
import 'package:movie_app/presentation/widgets/custom_app_bar.dart';

import 'package:movie_app/presentation/widgets/custom_container.dart';
import 'package:movie_app/presentation/widgets/custom_search_bar.dart';
import 'package:movie_app/presentation/widgets/search_bar_widget.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../widgets/custom_list_view_widget.dart';
import '../../../widgets/image_container_widget.dart';
import '../../../widgets/profile_row_widget.dart';


class FavoritesListView extends StatefulWidget {
  const FavoritesListView({super.key});
static const String routeName = "/favorites_list_view";
  @override
  State<FavoritesListView> createState() => _FavoritesListViewState();
}

class _FavoritesListViewState extends State<FavoritesListView> {
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
              CustomAppBar(
                title: "My Favorites List",
              ),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 6,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                           // crossAxisSpacing: 4.w,
                            mainAxisSpacing: 8.h,
                            //childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) {
                            return  FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageContainer(
                                    height:248.h ,
                                    width: 172.5.w,
                                    image: AssetsPath.liveImage1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Padding(
                                         padding:  EdgeInsets.only(top: 6.h,left: 10.w,),
                                         child: CustomContainer(
                                           backgroundColor: AppColors.primary,
                                           height: 24.h,
                                           width: 36.w,
                                           child: Text("9.6",style: AppTextStyle.commonStyle.copyWith(
                                             fontSize: 10.sp
                                           ),),
                                         ),
                                       ),
                                     ],
                                   ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Recommended for you",style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 22.sp),),
                    ),
                        SizedBox(
                          height: 350.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return  FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ImageContainer(
                                      height:248.h ,
                                      width: 172.5.w,
                                      image: AssetsPath.liveImage1,
                                    ),
                                    SizedBox(height: 8.h,),
                                    ProfileRowWidget(
                                      image: AssetsPath.liveImage1,
                                      title: "profile name",
                                      subtitle: "profileSubTitle",
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                      ],
                    ),
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


