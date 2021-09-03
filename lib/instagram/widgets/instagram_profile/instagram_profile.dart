import 'package:flutter/material.dart';

import 'widgets/instagram_profile_header/instagram_profile_header.dart';
import 'widgets/mentions_tab_content.dart';
import 'widgets/user_posts_tab_content.dart';

class InstagramProfile extends StatelessWidget {
  const InstagramProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: InstagramProfileHeader(),
            ),
          ];
        },
        body: TabBarView(
          children: [
            UserPostsTabContent(),
            MentionsTabContent(),
          ],
        ),
      ),
    );
  }
}
