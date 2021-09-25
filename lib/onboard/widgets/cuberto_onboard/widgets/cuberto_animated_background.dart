import 'package:flutter/material.dart';

class CubertoAnimatedBackground extends StatelessWidget {
  const CubertoAnimatedBackground({
    required this.colors,
    required this.child,
    required this.colorOffset,
    Key? key,
  }) : super(key: key);

  static const minRadius = 40.0;

  final List<Color> colors;
  final Widget child;
  final double colorOffset;

  double get _colorIndex => colorOffset.roundToDouble();

  double get _offset => colorOffset - _colorIndex;

  double get _direction => _offset == 0 ? 1 : _offset.sign;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CustomPaint(
      painter: CubertoBackgroundPainter(
        collapsedColor: colors[(_colorIndex + 1).toInt() % colors.length],
        expandedColor: colors[(_colorIndex).toInt()],
        minRadius: minRadius,
        radius: _direction *
            Tween(begin: minRadius, end: height * 8)
                .chain(CurveTween(curve: Curves.easeInOutCubic))
                .transform(_offset.abs()),
      ),
      child: child,
    );
  }
}

class CubertoBackgroundPainter extends CustomPainter {
  const CubertoBackgroundPainter({
    required this.collapsedColor,
    required this.expandedColor,
    required this.minRadius,
    required this.radius,
  });

  final Color collapsedColor;
  final Color expandedColor;
  final double minRadius;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = expandedColor;
    canvas.drawRect(Offset.zero & size, paint);
    paint.color = collapsedColor;
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 3 / 4).translate(radius - minRadius * radius.sign, 0),
      width: 2 * radius,
      height: 2 * radius,
    );
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
