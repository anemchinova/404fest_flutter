import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/highlights_section.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/profile_actions.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/profile_description.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/profile_infographics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class InstagramProfileHeader extends StatelessWidget {
  const InstagramProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: const [
        SliverToBoxAdapter(
          child: _BaseProfileHeader(),
        ),
        SliverPinnedHeader(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
            child: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 1,
              indicatorPadding: EdgeInsets.only(bottom: 1),
              tabs: [
                Tab(
                  icon: Icon(
                    CupertinoIcons.square_grid_3x2,
                    size: 18,
                  ),
                ),
                Tab(
                  icon: Icon(
                    CupertinoIcons.film,
                    size: 18,
                  ),
                ),
                Tab(
                  icon: Icon(
                    CupertinoIcons.play_arrow,
                    size: 18,
                  ),
                ),
                Tab(
                  icon: Icon(
                    CupertinoIcons.bubble_middle_top,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BaseProfileHeader extends StatelessWidget {
  const _BaseProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ProfileInfographics(),
          VerticalSpace(15),
          ProfileDescription(),
          VerticalSpace(20),
          ProfileActions(),
          VerticalSpace(20),
          HighlightsSection(),
        ],
      ),
    );
  }
}
