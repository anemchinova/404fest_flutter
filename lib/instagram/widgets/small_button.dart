import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      child: child,
      padding: EdgeInsets.zero,
      minSize: 40,
    );
  }
}
