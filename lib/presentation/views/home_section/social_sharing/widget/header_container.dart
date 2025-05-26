import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets_path.dart';
import '../../../../widgets/icon_box_widget.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.h,
      width: 392.w,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsPath.socialSharingImage),fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.only(
            top: 16.h,
            bottom: 16.h,
            right: 20.w,
            left: 20.w
        ),
        child: Column(children: [
          SizedBox(height: 64.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBoxWidget(icon: AssetsPath.arrowIcon),
              IconBoxWidget(icon: AssetsPath.categoriesIcon),
            ],
          ),
        ],),
      ),
    );
  }
}