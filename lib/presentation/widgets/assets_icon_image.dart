import 'package:flutter/material.dart';

class AssetsIconWidget extends StatelessWidget {
  const AssetsIconWidget({
    super.key, required this.path, required this.height, required this.width, this.color,
  });
  final String path;
  final double height;
  final double width;
 final Color? color;
  @override
  Widget build(BuildContext context) {
    return Image.asset(path,height:height,
        width:width,
        color: color,
    );
  }
}