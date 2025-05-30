import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/domain/entities/download_storage_entities.dart';
import 'package:movie_app/presentation/controller/download_storage_controller.dart';
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
import '../widgets/list_tile_widget.dart';
import '../widgets/storage_widget.dart';

class DownloadStorageManagementView extends StatefulWidget {
  const DownloadStorageManagementView({super.key});

  @override
  State<DownloadStorageManagementView> createState() =>
      _DownloadStorageManagementViewState();
}

class _DownloadStorageManagementViewState
    extends State<DownloadStorageManagementView> {
  @override
  Widget build(BuildContext context) {
    final controller= Get.find<DownloadStorageController>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(padding: EdgeInsets.all(20.h), child: CustomAppBar()),

          ///indicator
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 340.h,
                    width: double.infinity,
                    color: AppColors.primaryShade,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 5.0,
                          percent: 1.0,
                          center: Text("100%"),
                          progressColor: AppColors.primary,
                        ),

                        ///storage container
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: Column(
                            children: [SizedBox(height: 24.h),
                              StorageWidget(

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///text
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 24.h),
                            DownloadedTextWidget(),
                            SizedBox(height: 24.h),
                          ],
                        ),

                        ///downloaded items
                        FutureBuilder<List<DownloadStorageEntity>>(
                          future: controller.getDownloadStorageFuture(),
                          builder: (BuildContext context, snapshot) {
                            if(snapshot.connectionState==ConnectionState.waiting){
                              return const Center(child: CircularProgressIndicator(),);
                            }else if(snapshot.hasError){
                              return Center(child: Text("Error: ${snapshot.error}"));
                            }else if(!snapshot.hasData || snapshot.data!.isEmpty){
                              return const Center(child: Text("No categories found"));
                            }
                            else{
                              final downloadedItems=snapshot.data!;
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: downloadedItems.length,
                                itemBuilder: (context, index) {
                                  return DownloadedItemWidget(
                                    title: downloadedItems[index].title,
                                    subtitle: downloadedItems[index].subtitle,
                                    image: AssetsPath.tvImage1,
                                    dataSize: downloadedItems[index].dataSize,

                                  );
                                },
                              );
                            }

                          },
                        ),
                        ///text section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Easy Download", style: AppTextStyle.commonStyle),
                            Text(
                              "Save time with bulk actions—clear all downloads at once or auto-delete old content when storage is low. Manage space with ease.",
                              style: AppTextStyle.bodyMediumStyle,
                            ),
                            ListTileWidget(title:"Cloud Sync",
                              subtitle:  "*When Low on Space",
                              trailing:  Icon(Icons.switch_account_outlined),),
                            ListTileWidget(title: "Auto-Delete",
                              subtitle:"*Movies backed up",
                              trailing:  Icon(Icons.switch_account_outlined),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Clear All Downloads",
                                  style: AppTextStyle.commonStyle,
                                ),
                                OutlineContainerWidget(
                                  height: 44.h,
                                  width: 149.w,
                                  text: "Bulk Delete",
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//

//
// return Scaffold(
// appBar: AppBar(title: const Text("Category List")),
// body: FutureBuilder<List<CategoryEntity>>(
// future: controller.getCategoriesFuture(),
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(child: CircularProgressIndicator());
// } else if (snapshot.hasError) {
// return Center(child: Text("Error: ${snapshot.error}"));
// } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// return const Center(child: Text("No categories found"));
// } else {
// final categories = snapshot.data!;
// return ListView.builder(
// itemCount: categories.length,
// itemBuilder: (context, index) {
// final category = categories[index];
// return ListTile(
// title: Text(category.name),
// leading: CircleAvatar(child: Text(category.id)),
// );
// },
// );
// }
// },
// ),
// );