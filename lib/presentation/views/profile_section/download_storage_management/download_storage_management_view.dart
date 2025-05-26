import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/widgets/assets_icon_image.dart';
import 'package:movie_app/presentation/widgets/custom_container.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../home_section/social_sharing/widget/outline_container_widget.dart';
import '../widgets/downloaded_text_widget.dart';
import '../widgets/downloded_item_widget.dart';
import '../widgets/storage_widget.dart';

class DownloadStorageManagementView extends StatefulWidget {
  const DownloadStorageManagementView({super.key});

  @override
  State<DownloadStorageManagementView> createState() => _DownloadStorageManagementViewState();
}

class _DownloadStorageManagementViewState extends State<DownloadStorageManagementView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding:  EdgeInsets.all(20.h),
            child: CustomAppBar(),
          ),
          ///indicator
          Container(
            height: 340.h,
            width: double.infinity,
          color: AppColors.primaryShade,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center:  Text("100%"),
                  progressColor: Colors.green,
                ),
                ///storage container
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(

                    children: [
                      SizedBox(height: 24.h,),
                      StorageWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ///text
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              children: [
                SizedBox(height: 24.h,),
                DownloadedTextWidget(),
                SizedBox(height: 24.h,),
              ],
            ),
          ),
          ///downloaded items
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
                    child: DownloadedItemWidget(),
                  );

                }),
          ),
        ],
      ),
    );
  }
}








