import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/views/home_section/social_sharing/widget/rating_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../widgets/assets_icon_image.dart';
import 'custom_painter.dart';
import 'outline_container_widget.dart';


class HipHopRow extends StatelessWidget {
  const HipHopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(width: 8.w);
    return SizedBox(
      width: double.infinity,
      child: Row(children: [
        GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                    child: CustomPaint(
                      painter: CustomPaintWidget(borderColor: Colors.purple),
                      child: RatingDialogWidget(), // তোমার মূল UI
                    ),
                  );
                },
              );
            },
            child: AssetsIconWidget(path: AssetsPath.starIcon, height: 15.83.h, width: 16.67.w)),
        gap,
        Text("9.8",style: AppTextStyle.commonStyle.copyWith(
            fontSize: 12.sp,
            color: AppColors.primary
        ),),
        gap,
        Icon(Icons.arrow_forward_ios,color: AppColors.primary,size: 16.sp,),
        gap,
        Text("2025",style: AppTextStyle.listViewStyle.copyWith(
          fontWeight: FontWeight.w600,
        ),),
        gap,
        OutlineContainerWidget(text: 'Subtitle',),
        gap,
        OutlineContainerWidget(text: 'United States',
          width: 83.w,
        ),
      ],),
    );
  }
}