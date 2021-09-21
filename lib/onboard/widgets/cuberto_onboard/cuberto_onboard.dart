import 'package:fest404/onboard/widgets/cuberto_onboard/widgets/cuberto_animated_background.dart';
import 'package:flutter/material.dart';

class CubertoOnboard extends StatefulWidget {
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
  State<CubertoOnboard> createState() => _CubertoOnboardState();
}

class _CubertoOnboardState extends State<CubertoOnboard> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CubertoAnimatedBackground(
      colors: widget.colors,
      pageController: _pageController,
      child: PageView(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        children: widget.children,
      ),
    );
  }
}
