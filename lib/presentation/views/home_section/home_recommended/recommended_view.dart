import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/assets_path.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/widgets/companion_widget.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/widgets/custom_color_container_widget.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/widgets/first_list_view_widget.dart';
import '../../../widgets/custom_list_view_widget.dart';
import '../../../widgets/custom_search_bar.dart';
import '../../../widgets/custom_shear_row.dart';
import '../../../widgets/image_container_widget.dart';

class RecommendedView extends StatefulWidget {
  const RecommendedView({super.key});

  @override
  State<RecommendedView> createState() => _RecommendedViewState();
}

class _RecommendedViewState extends State<RecommendedView> {
  @override
  Widget build(BuildContext context) {
    final Widget gapSm = SizedBox(height: 8.h);
    final Widget gap = SizedBox(height: 20.h);
    final Widget gapLg = SizedBox(height: 25.h);
    return Scaffold(
      body: Column(
        children: [
          ///header section
          Container(
            height: 420.h,
            width: 393.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsPath.homeHeader),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Stack(
                children: [
                  ///search section
                  Positioned(top: 54.h, child: CustomSearchBar()),
                  ///companion text
                  Positioned(bottom: 80.h, child: CompanionWidget()),
                  ///shear row
                  Positioned(
                    bottom: 10.h,
                    left: 0,
                    right: 0,
                    child: CustomShearRow(),
                  ),
                ],
              ),
            ),
          ),
          ///fist listview item
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                gapLg,
                ///first list view
                SizedBox(
                  height: 48.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ImageContainer(image: AssetsPath.homeHeader,borderRadius: 6.r,);
                    },
                  ),
                ),
                gap,
                ///color container
                CustomColorContainerWidget(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [

                    CustomListViewWidget(
                      textView: "",
                      titleText: 'Recommended for you',
                      image: AssetsPath.homeHeader,
                      text: "Hip Hop Road\nRedemption",),
                    gap,
                    CustomColorContainerWidget(),
                    CustomListViewWidget(
                      textView: "",
                      titleText: 'Streamly Original',
                      image: AssetsPath.homeHeader,
                      text: "Hip Hop Road\nRedemption",),
                    CustomListViewWidget(
                      sizeBoxHeight: 128.h,
                      height: 88.h,
                      width: 150.w,
                      titleText: 'TV Show',
                      image: AssetsPath.tvImage1,
                      text: "Hip Hop Road\nRedemption",),
                    CustomListViewWidget(
                      titleText: 'Popular Movies',
                      image: AssetsPath.homeHeader,
                      text: "Hip Hop Road\nRedemption",),
                    CustomListViewWidget(
                      titleText: 'Popular Drama',
                      image: AssetsPath.homeHeader,
                      text: "Hip Hop Road\nRedemption",),
                    CustomListViewWidget(
                      titleText: 'Popular Comedy Shows',
                      image: AssetsPath.homeHeader,
                      text: "Hip Hop Road\nRedemption",),
                    CustomListViewWidget(
                      titleText: 'Popular Animated Movies',
                      image: AssetsPath.homeHeader,
                      text: "Hip Hop Road\nRedemption",),
                    CustomListViewWidget(
                      titleText: 'Popular Comedy Shows',
                      image: AssetsPath.homeHeader,
                      text: "Hip Hop Road\nRedemption",),
                    CustomListViewWidget(
                      titleText: 'Best Documentaries',
                      image: AssetsPath.homeHeader,
                      text: "Hip Hop Road\nRedemption",),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}