import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:fest404/instagram/widgets/instagram_post/instagram_posts_page.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/post_tile.dart';
import 'package:fest404/instagram/widgets/nested_scroll_view/nested_scroll_view.dart' as x;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPostsTabContent extends StatelessWidget {
  const UserPostsTabContent({Key? key}) : super(key: key);

  void navigatedToPostsPage(BuildContext context, {required int postIndex}) {
    Navigator.of(context).push(
      CupertinoPageRoute<InstagramPostsPage>(
        builder: (context) => InstagramPostsPage(
          initialPostIndex: postIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var posts = instagramTestPosts;

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        x.SliverOverlapInjector(
          handle: x.NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return PostTile(
                post: posts[index],
                onPressed: () => navigatedToPostsPage(
                  context,
                  postIndex: index,
                ),
              );
            },
            childCount: posts.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
        ),
      ],
    );
  }
}
