import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/views/library_section/contain_detail/content_details_view.dart';
import 'package:movie_app/presentation/widgets/category_headline_row_text.dart';
import 'package:movie_app/presentation/widgets/movie_card_widget.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({
    super.key,
    required this.titleText,
    required this.image,
    required this.text,
    this.height,
    this.width,
    this.sizeBoxHeight,
    this.textView,
    this.itemCount,
    this.movieList,
  });

  final String titleText;
  final String image;
  final String text;
  final String? textView;
  final double? height;
  final double? width;
  final double? sizeBoxHeight;
  final int? itemCount;
  final List<Map<String, dynamic>>? movieList;

  @override
  Widget build(BuildContext context) {
    // Default mock movies list if not passed
    final List<Map<String, dynamic>> items = movieList ?? [
      {
        "title": text.replaceAll("\n", " ").trim().isNotEmpty ? text.replaceAll("\n", " ") : "Hip Hop Road Redemption",
        "genre": "Action • Drama",
        "rating": 8.7,
        "duration": "1h 58m",
        "image": image,
      },
      {
        "title": "Cyber Realm: 2099",
        "genre": "Sci-Fi • Thriller",
        "rating": 9.1,
        "duration": "2h 24m",
        "image": "assets/images/home/social_sharing_image.png",
      },
      {
        "title": "Shadow of the Dragon",
        "genre": "Fantasy • Adventure",
        "rating": 8.4,
        "duration": "2h 10m",
        "image": "assets/images/home/stream_original2.png",
      },
      {
        "title": "Neon Horizon",
        "genre": "Mystery • Crime",
        "rating": 8.9,
        "duration": "1h 45m",
        "image": image,
      },
      {
        "title": "The Last Echo",
        "genre": "Horror • Sci-Fi",
        "rating": 8.2,
        "duration": "1h 50m",
        "image": "assets/images/home/social_sharing_image.png",
      },
    ];

    final int count = itemCount ?? items.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        CategoryHeadlineRowText(
          titleText: titleText,
          textView: textView ?? "See All",
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: sizeBoxHeight ?? 245.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: count,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final movie = items[index % items.length];
              return MovieCardWidget(
                title: movie["title"] ?? "Movie Title",
                genre: movie["genre"] ?? "Genre",
                rating: (movie["rating"] is num) ? (movie["rating"] as num).toDouble() : 8.5,
                duration: movie["duration"] ?? "2h 00m",
                imagePath: movie["image"] ?? image,
                onTap: () {
                  Get.toNamed(ContentDetailsView.routeName);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
