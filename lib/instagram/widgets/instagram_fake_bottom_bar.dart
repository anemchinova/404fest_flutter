import 'package:fest404/core/widgets/svg_icon.dart';
import 'package:fest404/instagram/instagram_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const bottomBarIconSize = 26.0;

class InstagramFakeBottomBar extends StatelessWidget {
  const InstagramFakeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 48,
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SvgIcon(InstagramAssets.home, size: bottomBarIconSize),
                SvgIcon(InstagramAssets.search, size: bottomBarIconSize),
                SvgIcon(InstagramAssets.reels, size: bottomBarIconSize),
                SvgIcon(InstagramAssets.heart, size: bottomBarIconSize),
                Icon(CupertinoIcons.profile_circled, size: bottomBarIconSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
