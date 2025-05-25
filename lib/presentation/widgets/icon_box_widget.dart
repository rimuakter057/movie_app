import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_sizes.dart';
import 'assets_icon_image.dart';
import 'custom_container.dart';


class IconBoxWidget extends StatelessWidget {
  const IconBoxWidget({
    super.key, required this.icon, this.iconHeight, this.iconWidth,
  });
  final String icon;
  final double?iconHeight;
  final double?iconWidth;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        backgroundColor: AppColors.primaryShade,
        width: AppSizes.commonIconBackWidth,
        child: AssetsIconWidget(path:icon ,

          height:iconHeight?? AppSizes.commonIconHeight,
          width:iconWidth?? AppSizes.commonIconWidth,)
    );
  }
}
