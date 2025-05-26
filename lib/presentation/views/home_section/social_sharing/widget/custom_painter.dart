import 'package:flutter/material.dart';

class CustomPaintWidget extends CustomPainter {
  final Color borderColor;

  CustomPaintWidget({required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const radius = 40.0;
    final path = Path();

    // Top-left corner
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // Top line
    path.lineTo(size.width - radius, 0);

    // Top-right corner
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right side half
    path.lineTo(size.width, size.height / 2);

    // Move to left side from top
    path.moveTo(0, radius);
    path.lineTo(0, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


