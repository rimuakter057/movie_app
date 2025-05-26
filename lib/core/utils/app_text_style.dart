import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
class AppTextStyle {
  static TextStyle commonStyle =GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize:16.sp ,
    color: AppColors.white,
  );
  static TextStyle listViewStyle =GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle bodyMediumStyle =GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
}