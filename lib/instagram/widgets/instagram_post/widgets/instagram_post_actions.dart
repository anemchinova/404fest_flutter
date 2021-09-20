import 'package:fest404/core/widgets/svg_icon.dart';
import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:fest404/instagram/instagram_assets.dart';
import 'package:fest404/instagram/widgets/small_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramPostActions extends StatelessWidget {
  const InstagramPostActions({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          SmallButton(
            onPressed: () {},
            child: const SvgIcon(
              InstagramAssets.heart,
              size: 20,
              color: Colors.white,
            ),
          ),
          SmallButton(
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.chat_bubble,
              size: 20,
              color: Colors.white,
            ),
          ),
          SmallButton(
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.paperplane,
              size: 20,
              color: Colors.white,
            ),
          ),
          Expanded(child: Container()),
          SmallButton(
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.bookmark,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
