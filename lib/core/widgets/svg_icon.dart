import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.asset, {
    this.color = Colors.white,
    this.size,
    Key? key,
  }) : super(key: key);

  final String asset;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
      color: color,
    );
  }
}
