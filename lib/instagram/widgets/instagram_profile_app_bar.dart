import 'package:fest404/core/widgets/svg_icon.dart';
import 'package:fest404/instagram/data/instagram_profile_data.dart';
import 'package:fest404/instagram/instagram_assets.dart';
import 'package:fest404/instagram/widgets/small_button.dart';
import 'package:flutter/cupertino.dart';
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
      actions: [
        SmallButton(
          onPressed: () {},
          child: const SvgIcon(
            InstagramAssets.notifications,
            size: 20,
            color: Colors.white,
          ),
        ),
        SmallButton(
          onPressed: () {},
          child: const SvgIcon(
            InstagramAssets.more,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
