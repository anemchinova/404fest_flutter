import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:fest404/instagram/widgets/instagram_post/instagram_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramPostPage extends StatelessWidget {
  const InstagramPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var posts = instagramTestPosts;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: InstagramPost(post: posts[0])),
    );
  }
}
