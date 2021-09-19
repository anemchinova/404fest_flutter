import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramPostDescription extends StatelessWidget {
  const InstagramPostDescription({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  @override
  Widget build(BuildContext context) {
    const regularStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.2,
    );
    final mediumStyle = regularStyle.copyWith(
      fontWeight: FontWeight.w500,
    );
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: post.comments.isNotEmpty ? 2 : 3,
      text: TextSpan(
        style: regularStyle,
        children: [
          TextSpan(
            text: post.author.username,
            style: mediumStyle,
          ),
          if (post.description?.isNotEmpty == true)
            TextSpan(
              text: ' ${post.description}',
            )
          else
            const TextSpan(
              text: ' опубликовал фото',
            ),
        ],
      ),
    );
  }
}
