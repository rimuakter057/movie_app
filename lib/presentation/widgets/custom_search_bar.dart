import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/widgets/search_bar_widget.dart';

import 'custom_container_circle.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final Widget gap =SizedBox(width: 16.w,);
    return Row(children: [
      ///search bar
      SearchBarWidget(),
      gap,
      ///notification icon
      CustomCircleContainer(),



    ],
    );
  }
}