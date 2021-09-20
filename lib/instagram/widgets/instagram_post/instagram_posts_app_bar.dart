import 'package:fest404/instagram/data/instagram_profile_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstagramPostsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InstagramPostsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<InstagramProfileData>(context);

    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          Text(
            profile.username.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const Text(
            'Публикации',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      bottom: const PreferredSize(
        child: Divider(
          color: Colors.white12,
          thickness: 1,
          height: 1,
        ),
        preferredSize: Size.fromHeight(1),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
