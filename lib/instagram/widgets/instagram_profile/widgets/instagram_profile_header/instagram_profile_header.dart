import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'widgets/profile_buttons_bar.dart';
import 'widgets/profile_description.dart';
import 'widgets/profile_infographics.dart';
import 'widgets/stories_carousel.dart';

class InstagramProfileHeader extends StatelessWidget {
  const InstagramProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              ProfileInfographics(),
              ProfileDescription(),
              ProfileButtonBar(),
              StoriesCarousel(),
            ],
          ),
        ),
        SliverPinnedHeader(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
            child: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.photo_library)),
                Tab(icon: Icon(Icons.person_sharp)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
