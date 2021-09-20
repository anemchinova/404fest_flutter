import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramPostLikes extends StatelessWidget {
  const InstagramPostLikes({
    Key? key,
    required this.post,
  }) : super(key: key);

  static const int maxAvatarsNumber = 3;

  final InstagramPostData post;

  List<String> get avatarsUrls =>
      post.whoLiked.map((e) => e.avatarUrl).whereType<String>().take(maxAvatarsNumber).toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _UserLikesAvatars(avatarUrls: avatarsUrls),
        const HorizontalSpace(3),
        Flexible(child: _LikesDescription(post: post)),
      ],
    );
  }
}

class _LikesDescription extends StatelessWidget {
  const _LikesDescription({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  @override
  Widget build(BuildContext context) {
    const regularStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    final mediumStyle = regularStyle.copyWith(
      fontWeight: FontWeight.w500,
    );
    if (post.whoLiked.isEmpty) {
      return Text(
        'Нравится: ${post.totalLikeCount}',
        style: mediumStyle,
      );
    }
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        style: regularStyle,
        children: [
          const TextSpan(
            text: 'Нравится ',
          ),
          TextSpan(
            text: post.whoLiked[0].username,
            style: mediumStyle,
          ),
          if (post.totalLikeCount > 1) ...[
            const TextSpan(
              text: ' и ',
            ),
            TextSpan(
              text: 'ещё ${post.totalLikeCount - 1}',
              style: mediumStyle,
            ),
          ]
        ],
      ),
    );
  }
}

class _UserLikesAvatars extends StatelessWidget {
  const _UserLikesAvatars({
    Key? key,
    required this.avatarUrls,
  }) : super(key: key);

  static const double _avatarRadius = 8;
  static const double _avatarPadding = 1.5;

  final List<String> avatarUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: avatarUrls.length * (_avatarRadius * 3 / 2 + _avatarPadding * 2),
      height: (_avatarRadius + _avatarPadding) * 2,
      child: Stack(
        children: [
          for (int i = avatarUrls.length - 1; i >= 0; i--)
            Positioned(
              left: _avatarRadius * 3 / 2 * i,
              child: _UserLikesAvatar(
                avatarUrl: avatarUrls[i],
                radius: _avatarRadius,
                padding: _avatarPadding,
              ),
            ),
        ],
      ),
    );
  }
}

class _UserLikesAvatar extends StatelessWidget {
  const _UserLikesAvatar({
    Key? key,
    required this.avatarUrl,
    required this.radius,
    required this.padding,
  }) : super(key: key);

  final String avatarUrl;
  final double radius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        //TODO
        //  color: Theme.of(context).backgroundColor,
        color: Colors.black,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(avatarUrl),
      ),
    );
  }
}
