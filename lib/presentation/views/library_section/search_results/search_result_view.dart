
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/presentation/widgets/custom_search_bar.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key});

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomSearchBarWidget(),
        Chip(
          side: BorderSide(
            color:AppColors.primary,
            width: 1.5,
          ),
          backgroundColor: Colors.black,
          label:  Text('Aaron Burr',style: TextStyle(
            color: AppColors.primary
          ),),
        )
      ],),
    );
  }
}
