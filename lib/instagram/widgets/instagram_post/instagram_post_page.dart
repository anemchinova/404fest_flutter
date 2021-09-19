import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:fest404/instagram/widgets/instagram_post/instagram_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class InstagramPostsPage extends StatelessWidget {
  const InstagramPostsPage({
    Key? key,
    this.initialPostIndex = 0,
  }) : super(key: key);

  final int initialPostIndex;

  @override
  Widget build(BuildContext context) {
    var posts = instagramTestPosts;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ScrollablePositionedList.builder(
          initialScrollIndex: initialPostIndex,
          itemCount: instagramTestPosts.length,
          itemBuilder: (context, index) => InstagramPost(post: posts[index]),
        ),
      ),
    );
  }
}
