import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/instagram_profile_header.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/mentions_tab_content.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/reels_tab_content.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/user_posts_tab_content.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/videos_tab_content.dart';
import 'package:fest404/instagram/widgets/nested_scroll_view/nested_scroll_view.dart' as x;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramProfile extends StatelessWidget {
  const InstagramProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: x.NestedScrollViewX(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const CupertinoSliverRefreshControl(),
            x.SliverOverlapAbsorber(
              handle: x.NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: const InstagramProfileHeader(),
            ),
          ];
        },
        body: const TabBarView(
          children: [
            UserPostsTabContent(),
            ReelsTabContent(),
            VideosTabContent(),
            MentionsTabContent(),
          ],
        ),
      ),
    );
  }
}
