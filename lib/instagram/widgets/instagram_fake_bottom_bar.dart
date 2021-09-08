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
                Icon(CupertinoIcons.home, size: bottomBarIconSize),
                Icon(CupertinoIcons.search, size: bottomBarIconSize),
                Icon(CupertinoIcons.film, size: bottomBarIconSize),
                Icon(CupertinoIcons.heart, size: bottomBarIconSize),
                Icon(CupertinoIcons.profile_circled, size: bottomBarIconSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
