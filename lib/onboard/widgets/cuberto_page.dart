import 'package:flutter/material.dart';

class CubertoPage extends StatelessWidget {
  const CubertoPage({
    required this.child,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  static const chevronSize = 24.0;
  static const chevronPadding = 8.0;

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).size.height / 4 - chevronSize / 2 - chevronPadding,
          child: GestureDetector(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.all(chevronPadding),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: chevronSize,
              ),
            ),
          ),
        )
      ],
    );
  }
}
