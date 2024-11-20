// lib/widgets/card_pattern_painter.dart

import 'package:flutter/material.dart';

class CardPatternPainter extends CustomPainter {
  final Color color;

  CardPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();
    final spacing = size.width * 0.1;
    
    for (var i = 0.0; i < size.width * 1.5; i += spacing) {
      path.moveTo(i, -size.height);
      path.lineTo(i - size.height, size.height * 2);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CardPatternPainter oldDelegate) => false;
}