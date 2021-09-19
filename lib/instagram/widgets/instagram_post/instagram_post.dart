import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:fest404/instagram/widgets/instagram_post/widgets/instagram_post_actions.dart';
import 'package:fest404/instagram/widgets/instagram_post/widgets/instagram_post_comments.dart';
import 'package:fest404/instagram/widgets/instagram_post/widgets/instagram_post_content.dart';
import 'package:fest404/instagram/widgets/instagram_post/widgets/instagram_post_description.dart';
import 'package:fest404/instagram/widgets/instagram_post/widgets/instagram_post_footer.dart';
import 'package:fest404/instagram/widgets/instagram_post/widgets/instagram_post_header.dart';
import 'package:fest404/instagram/widgets/instagram_post/widgets/instagram_post_likes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramPost extends StatelessWidget {
  const InstagramPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InstagramPostHeader(post: post),
        InstagramPostContent(post: post),
        InstagramPostActions(post: post),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (post.totalLikeCount > 0) ...[
                InstagramPostLikes(post: post),
                const VerticalSpace(5),
              ],
              InstagramPostDescription(post: post),
              if (post.comments.isNotEmpty) InstagramPostComments(post: post),
              const VerticalSpace(5),
              InstagramPostFooter(post: post)
            ],
          ),
        ),
      ],
    );
  }
}
