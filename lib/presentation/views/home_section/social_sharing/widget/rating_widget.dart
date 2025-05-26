// // rating_dialog_widget.dart
//
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_text_style.dart';
// import '../../../../widgets/custom_container.dart';
// import 'outline_container_widget.dart';
//
// class RatingDialogWidget extends StatefulWidget {
//   const RatingDialogWidget({super.key});
//
//   @override
//   State<RatingDialogWidget> createState() => _RatingDialogWidgetState();
// }
//
// class _RatingDialogWidgetState extends State<RatingDialogWidget> {
//   double selectedRating = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: const Color(0xFF1E062D),
//       shape: RoundedRectangleBorder(
//           side:  BorderSide(color:AppColors.primary,width: 1.w),
//           borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(40.r),
//         topRight: Radius.circular(40.r),
//       )),
//       contentPadding: const EdgeInsets.all(20),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//              Text(
//               'Give Rating',
//               style: AppTextStyle.commonStyle.copyWith(
//                 fontSize: 24.sp,
//                 fontWeight: FontWeight.w700
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                  Text(
//                   '9.8',
//                    style: AppTextStyle.commonStyle.copyWith(
//                        fontSize: 40.sp,
//                        fontWeight: FontWeight.w700
//                    ),
//                 ),
//                 Column(
//                   children: [
//                     SizedBox(height: 30.h),
//                     const Text('/10', style: TextStyle(color: Colors.white, fontSize: 18)),
//                   ],
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 4),
//                     Row(
//                       children: List.generate(
//                         5,
//                             (index) => const Icon(Icons.star, size: 12, color: AppColors.primary),
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     Text('(24,679 users)',
//                       style: AppTextStyle.commonStyle.copyWith(
//                           fontSize: 10.sp,
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.secondaryText
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 _buildRatingBar(5, 0.95),
//                 _buildRatingBar(4, 0.75),
//                 _buildRatingBar(3, 0.2),
//                 _buildRatingBar(2, 0.1),
//                 _buildRatingBar(1, 0.05),
//                 const SizedBox(height: 20),
//                 RatingBar.builder(
//                   initialRating: 0,
//                   minRating: 1,
//                   direction: Axis.horizontal,
//                   allowHalfRating: false,
//                   itemCount: 5,
//                   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.purple),
//                   onRatingUpdate: (rating) {
//                     setState(() {
//                       selectedRating = rating;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//             Row(
//               children: [
//                 CustomContainer(
//                   backgroundColor: AppColors.primaryShade,
//                   width: 113.w,
//                   child: Center(
//                     child:Text("Cancel", style: AppTextStyle.commonStyle),
//                   ),
//                 ),
//                   SizedBox(width: 24.w,),
//                 CustomContainer(
//                   backgroundColor: AppColors.primary,
//                   width: 114.w,
//                   child: Center(
//                     child:Text("Submit", style: AppTextStyle.commonStyle),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRatingBar(int star, double percent) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         children: [
//           Text('$star', style: const TextStyle(color: Colors.white)),
//           const SizedBox(width: 4),
//           const Icon(Icons.star, color: Colors.purple, size: 14),
//           const SizedBox(width: 8),
//           Expanded(
//             child: LinearProgressIndicator(
//               value: percent,
//               backgroundColor: Colors.grey[800],
//               valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
//               minHeight: 6,
//               borderRadius: BorderRadius.circular(4),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../widgets/custom_container.dart';

class RatingDialogWidget extends StatefulWidget {
  const RatingDialogWidget({super.key});

  @override
  State<RatingDialogWidget> createState() => _RatingDialogWidgetState();
}

class _RatingDialogWidgetState extends State<RatingDialogWidget> {
  double selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color:  Color(0xFF1E062D),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),

      ),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Give Rating',
              style: AppTextStyle.commonStyle.copyWith(
                  fontSize: 24.sp, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '9.8',
                            style: AppTextStyle.commonStyle.copyWith(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.h), // Adjust as needed
                            child: Text(
                              '/10',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          5,
                              (index) =>
                          const Icon(Icons.star, size: 12, color: AppColors.primary),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '(24,679 users)',
                        style: AppTextStyle.commonStyle.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryText),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildRatingBar(5, 0.95),
                      _buildRatingBar(4, 0.75),
                      _buildRatingBar(3, 0.2),
                      _buildRatingBar(2, 0.1),
                      _buildRatingBar(1, 0.05),
                      const SizedBox(height: 20),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),

                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.primary,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainer(
                  backgroundColor: AppColors.primaryShade,
                  width: 113.w,
                  child: Center(
                    child: Text("Cancel", style: AppTextStyle.commonStyle),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                CustomContainer(
                  backgroundColor: AppColors.primary,
                  width: 114.w,
                  child: Center(
                    child: Text("Submit", style: AppTextStyle.commonStyle),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBar(int star, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text('$star', style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 4),
          const Icon(Icons.star, color: Colors.purple, size: 14),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[800],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
              minHeight: 6,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
