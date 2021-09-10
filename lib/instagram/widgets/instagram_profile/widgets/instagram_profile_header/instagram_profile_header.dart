import 'package:fest404/core/widgets/svg_icon.dart';
import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/instagram_assets.dart';
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
                  icon: SvgIcon(
                    InstagramAssets.grid,
                    size: 24,
                  ),
                ),
                Tab(
                  icon: SvgIcon(
                    InstagramAssets.reels,
                    size: 24,
                  ),
                ),
                Tab(
                  icon: SvgIcon(
                    InstagramAssets.playOutline,
                    size: 24,
                  ),
                ),
                Tab(
                  icon: SvgIcon(
                    InstagramAssets.mentions,
                    size: 24,
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

  static const padding = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ProfileInfographics(padding: padding),
        VerticalSpace(15),
        ProfileDescription(padding: padding),
        VerticalSpace(20),
        ProfileActions(padding: padding),
        VerticalSpace(20),
        HighlightsSection(padding: padding),
      ],
    );
  }
}
