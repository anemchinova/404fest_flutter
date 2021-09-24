import 'package:fest404/crypto_wallet/neu/neu.dart';
import 'package:fest404/crypto_wallet/widgets/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _iconPadding = EdgeInsets.all(12);
const _iconSize = 24.0;

class DashboardBottomBar extends StatelessWidget {
  const DashboardBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomBarIcon(
            iconData: CupertinoIcons.home,
            onTap: () {},
          ),
          _BottomBarIcon(
            iconData: CupertinoIcons.creditcard,
            onTap: () {},
          ),
          _BottomBarIcon(
            iconData: CupertinoIcons.chart_bar,
            onTap: () {},
          ),
          _BottomBarIcon(
            iconData: CupertinoIcons.profile_circled,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _BottomBarIcon extends StatelessWidget {
  const _BottomBarIcon({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return NeuIconButton(
      padding: _iconPadding,
      onTap: () {},
      child: Icon(
        iconData,
        color: AppColors.textColor,
        size: _iconSize,
      ),
    );
  }
}
