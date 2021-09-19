import 'package:fest404/core/widgets/svg_icon.dart';
import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:fest404/instagram/instagram_assets.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/circle_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramPostHeader extends StatelessWidget {
  const InstagramPostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CirclePhoto.postAuthorAvatar(imageUrl: post.author.avatarUrl),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.author.username,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (post.location != null) Text(post.location!),
              ],
            ),
          ),
          CupertinoButton(
            onPressed: () {},
            child: const SvgIcon(
              InstagramAssets.more,
              size: 20,
              color: Colors.white,
            ),
            padding: EdgeInsets.zero,
            minSize: 40,
          ),
        ],
      ),
    );
  }
}
