import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets_path.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/widgets/companion_widget.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/widgets/custom_color_container_widget.dart';
import 'package:movie_app/presentation/views/home_section/home_recommended/widgets/first_list_view_widget.dart';
import 'package:movie_app/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/presentation/widgets/search_bar_widget.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../widgets/category_headline_row_text.dart';
import '../../../widgets/custom_list_view_widget.dart';
import '../../../widgets/custom_search_bar.dart';
import '../../../widgets/custom_shear_row.dart';
import '../../../widgets/image_container_widget.dart';
import '../common_widgets/categories_item_widget.dart';

class ContentLibraryView extends StatefulWidget {
  const ContentLibraryView({super.key});

  @override
  State<ContentLibraryView> createState() => _ContentLibraryViewState();
}

class _ContentLibraryViewState extends State<ContentLibraryView> {
  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: 24.h);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 54.h,),
            SearchBarWidget(),
               gap,
            ///all categories
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CategoryHeadlineRowText(titleText: 'Curated Playlists'),
                    gap,
                    CategoryItemsWidget(image: AssetsPath.socialSharingImage),
                    gap,
                    CategoryHeadlineRowText(titleText: 'New & Popular'),
                    gap,
                    CategoryItemsWidget(
                      boxHeight: 148.h,
                      image: AssetsPath.tvImage1,
                    child: Text("new",style: AppTextStyle.bodyMediumStyle.copyWith(fontSize: 12.sp,color: AppColors.secondaryText),),
                    ),
                    gap,

                    CategoryHeadlineRowText(titleText: 'Upcoming Live Streams'),
                    gap,
                    CategoryItemsWidget(image: AssetsPath.socialSharingImage),
                    gap,

                    CategoryHeadlineRowText(titleText: 'You May Also Like'),
                    gap,
                    CategoryItemsWidget(
                      boxHeight: 160.h,
                      image: AssetsPath.socialSharingImage,
                    ),
                    gap,
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


