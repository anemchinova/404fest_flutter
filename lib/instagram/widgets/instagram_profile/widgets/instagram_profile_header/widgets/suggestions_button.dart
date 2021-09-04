import 'package:fest404/instagram/widgets/outlined_button.dart';
import 'package:flutter/material.dart';

class SuggestionsButton extends StatelessWidget {
  const SuggestionsButton({
    Key? key,
    required this.onPressed,
    this.iconAngleAnimation,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Animation<double>? iconAngleAnimation;

  @override
  Widget build(BuildContext context) {
    Widget child = const Icon(
      Icons.keyboard_arrow_down_rounded,
      size: 12,
    );

    var iconAngleAnimation = this.iconAngleAnimation;
    if (iconAngleAnimation != null) {
      child = AnimatedBuilder(
        animation: iconAngleAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: iconAngleAnimation.value,
            child: child,
          );
        },
        child: child,
      );
    }

    return BaseOutlinedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
