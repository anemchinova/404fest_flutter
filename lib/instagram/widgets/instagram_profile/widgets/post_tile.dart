import 'package:cached_network_image/cached_network_image.dart';
import 'package:fest404/core/widgets/svg_icon.dart';
import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:fest404/instagram/instagram_assets.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    Key? key,
    required this.post,
    required this.onPressed,
  }) : super(key: key);

  final InstagramPostData post;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned.fill(
            child: LayoutBuilder(builder: (context, constraints) {
              return CachedNetworkImage(
                imageUrl: post.coverUrl,
                fit: BoxFit.cover,
                memCacheHeight: constraints.maxHeight.toInt(),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _PostTileIconSelector(
              postType: post.type,
            ),
          ),
        ],
      ),
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
