import 'package:fest404/instagram/instagram_profile_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstagramProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InstagramProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<InstagramProfileData>(context);

    return AppBar(
      centerTitle: true,
      title: Text(
        profile.username,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: const [
        Icon(Icons.notifications_outlined),
        Icon(Icons.more_horiz),
      ],
    );

    return SafeArea(
      child: SizedBox(
        height: preferredSize.height,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  profile.username,
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: const [
                    Icon(Icons.plus_one_outlined),
                    SizedBox(width: 24),
                    Icon(Icons.menu),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
