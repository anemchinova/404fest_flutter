import 'package:flutter/material.dart';

class CubertoAnimatedBackground extends StatelessWidget {
  const CubertoAnimatedBackground({
    required this.colors,
    required this.pageController,
    required this.child,
    Key? key,
  }) : super(key: key);

  final List<Color> colors;
  final PageController pageController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, _) {
        final progress = pageController.hasClients ? pageController.page! : 0.0;

        return CustomPaint(
          painter: CubertoBackgroundPainter(
            colors: colors,
            progress: progress,
          ),
          child: child,
        );
      },
    );
  }
}

class CubertoBackgroundPainter extends CustomPainter {
  const CubertoBackgroundPainter({
    required this.colors,
    required this.progress,
  });

  final List<Color> colors;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final progressFloor = progress ~/ 1;
    final progressCeil = progressFloor + 1;

    final isFirstHalf = progress % 1 < 0.5;

    final backgroundColor =
        isFirstHalf ? colors[progressFloor] : colors[progressCeil];

    final backgroundPaint = Paint()..color = backgroundColor;

    canvas.drawRect(Offset.zero & size, backgroundPaint);

    if (progressCeil == colors.length) return;

    final circleColor =
        isFirstHalf ? colors[progressCeil] : colors[progressFloor];
    final circlePaint = Paint()..color = circleColor;

    final circleInitialPosition = Offset(size.width / 2, size.height * 0.75);
    const initialRadius = 45.0;

    canvas.drawCircle(circleInitialPosition, initialRadius, circlePaint);
  }

  @override
  bool shouldRepaint(CubertoBackgroundPainter oldDelegate) =>
      colors != oldDelegate.colors || progress != oldDelegate.progress;
}
