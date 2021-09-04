import 'package:fest404/instagram/instagram_post_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Image.network(
          post.coverUrl,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _PostTileIconSelector(
            postType: post.type,
          ),
        ),
      ],
    );
  }
}

class _PostTileIconSelector extends StatelessWidget {
  const _PostTileIconSelector({
    Key? key,
    required this.postType,
  }) : super(key: key);

  final InstagramPostDataType postType;

  @override
  Widget build(BuildContext context) {
    IconData? iconData;

    switch (postType) {
      case InstagramPostDataType.photo:
        break;
      case InstagramPostDataType.album:
        iconData = CupertinoIcons.rectangle_stack_fill;
        break;
      case InstagramPostDataType.video:
        iconData = CupertinoIcons.play_arrow_solid;
        break;
      case InstagramPostDataType.reel:
        iconData = CupertinoIcons.film;
        break;
    }

    if (iconData == null) return const SizedBox.shrink();

    return Icon(
      iconData,
      size: 20,
      color: Colors.white,
    );
  }
}
