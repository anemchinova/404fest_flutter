import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/instagram_profile_header.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/mentions_tab_content.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/user_posts_tab_content.dart';
import 'package:fest404/instagram/widgets/nested_scroll_view/nested_scroll_view.dart' as x;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramProfile extends StatefulWidget {
  const InstagramProfile({Key? key}) : super(key: key);

  @override
  _InstagramProfileState createState() => _InstagramProfileState();
}

class _InstagramProfileState extends State<InstagramProfile> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Size: ${MediaQuery.of(context).size.width}');
    return DefaultTabController(
      length: 2,
      child: x.NestedScrollViewX(
        controller: _controller,
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
            MentionsTabContent(),
          ],
        ),
      ),
    );
  }
}
