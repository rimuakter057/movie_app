import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';
import '../views/home_section/home_recommended/widgets/first_list_view_widget.dart';
import 'category_headline_row_text.dart';
import 'image_container_widget.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({
    super.key, required this.titleText,
    required this.image, required this.text,
    this.height, this.width, this.sizeBoxHeight,
    this.textView,
    this.itemCount,

  });

  final String titleText;
  final String image;
  final String text;
  final String ?textView;
 final double ?height;
 final double ? width;
  final double ?sizeBoxHeight;
final int ?itemCount;
  @override
  Widget build(BuildContext context) {
    final Widget gapSm = SizedBox(height: 4.h);
    final Widget gap = SizedBox(height: 20.h);
    final Widget gapLg = SizedBox(height: 25.h);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapLg,
        CategoryHeadlineRowText(titleText: titleText, textView: textView),
        gap,
        SizedBox(
          height:sizeBoxHeight??268.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:itemCount?? 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageContainer(
                      width:width?? 172.5.w,
                      height:height?? 224.h,
                      image: image,

                    ),
                    gapSm,
                    Flexible(
                      child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text,style: AppTextStyle.bodyMediumStyle),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

