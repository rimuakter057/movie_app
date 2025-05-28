import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_text_style.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key, required this.title, required this.subtitle, required this.trailing,
  });
  final String title;
  final String subtitle;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing:trailing,
      title: Text(
        title,
        style: AppTextStyle.bodyMediumStyle,
      ),
      subtitle: Text(subtitle
        ,
        style: AppTextStyle.bodyMediumStyle.copyWith(
          fontSize: 12.sp,
          color: Color(0x99FFFFFF),
        ),
      ),
    );
  }
}