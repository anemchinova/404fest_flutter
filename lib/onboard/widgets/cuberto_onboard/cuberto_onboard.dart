import 'package:fest404/onboard/widgets/cuberto_onboard/widgets/cuberto_animated_background.dart';
import 'package:flutter/material.dart';

class CubertoOnboard extends StatelessWidget {
  const CubertoOnboard({
    required this.colors,
    required this.children,
    Key? key,
  })  : assert(children.length != 0, 'Children list must not be empty'),
        assert(
          colors.length == children.length,
          'Colors & children length must have same length',
        ),
        super(key: key);

  final List<Color> colors;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CubertoAnimatedBackground(
      colors: colors,
      child: PageView(
        children: children,
      ),
    );
  }
}
