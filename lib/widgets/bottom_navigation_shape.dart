import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  ShapePainter({required this.color, required this.avatarRadius});

  final Color color;
  final double avatarRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTWH(0, 0, size.width, 0);
    _drawBackground(canvas, shapeBounds, size);
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds, Size size) {
    final paint = Paint()..color = color;
    final backgroundPath = Path();
    final halfWidth = size.width / 2;
    const halfSpace = 100 / 2;
    const cornerRadius = 0.3; // Set the radius here

    backgroundPath.lineTo(halfWidth - halfSpace, 0);
    backgroundPath.quadraticBezierTo(
        size.width * 0.4, 0, shapeBounds.width * 0.4, cornerRadius);
    backgroundPath.arcToPoint(Offset(size.width * 0.6, cornerRadius),
        radius: const Radius.circular(cornerRadius), clockwise: false);
    backgroundPath.quadraticBezierTo(
        size.width * 0.60, 0, shapeBounds.width * 0.65, 0);
    backgroundPath.lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy);
    backgroundPath.lineTo(size.width, size.height);
    backgroundPath.lineTo(0, size.height);
    backgroundPath.close();
    canvas.drawPath(backgroundPath, paint);
  }

  @override
  bool shouldRepaint(ShapePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}