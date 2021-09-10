import 'package:fest404/core/widgets/svg_icon.dart';
import 'package:fest404/instagram/instagram_assets.dart';
import 'package:fest404/instagram/instagram_post_data.dart';
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
    switch (postType) {
      case InstagramPostDataType.album:
        return const SvgIcon(InstagramAssets.layers, size: 16);
      case InstagramPostDataType.video:
        return const SvgIcon(InstagramAssets.playFilled, size: 16);
      case InstagramPostDataType.reel:
        return const SvgIcon(InstagramAssets.reels, size: 20);
      default:
        return const SizedBox.shrink();
    }
  }
}
