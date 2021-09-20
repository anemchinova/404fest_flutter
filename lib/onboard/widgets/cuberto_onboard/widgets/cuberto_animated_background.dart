import 'package:flutter/material.dart';

class CubertoAnimatedBackground extends StatelessWidget {
  const CubertoAnimatedBackground({
    required this.colors,
    required this.child,
    Key? key,
  }) : super(key: key);

  final List<Color> colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CubertoBackgroundPainter(
        colors: colors,
      ),
      child: child,
    );
  }
}

class CubertoBackgroundPainter extends CustomPainter {
  const CubertoBackgroundPainter({
    required this.colors,
  });

  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = colors.first;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
