import 'package:fest404/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CubertoPage extends StatelessWidget {
  const CubertoPage({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const VerticalSpace(40),
        Text(title),
      ],
    );
  }
}
