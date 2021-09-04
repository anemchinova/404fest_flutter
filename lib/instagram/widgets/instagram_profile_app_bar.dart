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
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
