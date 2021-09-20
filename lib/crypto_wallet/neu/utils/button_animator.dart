import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonAnimator extends StatefulWidget {
  const ButtonAnimator({
    Key? key,
    required this.child,
    required this.onTap,
    this.enabled = true,
    required this.animationController,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final bool enabled;
  final AnimationController animationController;

  @override
  _CupertinoButtonState createState() => _CupertinoButtonState();
}

class _CupertinoButtonState extends State<ButtonAnimator> with SingleTickerProviderStateMixin {
  static const Duration kOutDuration = Duration(milliseconds: 100);
  static const Duration kInDuration = Duration(milliseconds: 300);

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = widget.animationController;
  }

  @override
  void didUpdateWidget(ButtonAnimator old) {
    super.didUpdateWidget(old);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) return;
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(1.0, duration: kOutDuration)
        : _animationController.animateTo(0.0, duration: kInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTapCancel: enabled ? _handleTapCancel : null,
      onTap: widget.onTap,
      child: widget.child,
    );
  }
}
