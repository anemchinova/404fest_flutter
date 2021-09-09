import 'package:fest404/instagram/instagram_reel_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/reel_tile.dart';
import 'package:fest404/instagram/widgets/nested_scroll_view/nested_scroll_view.dart'
    as x;
import 'package:flutter/material.dart';

class ReelsTabContent extends StatelessWidget {
  const ReelsTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        x.SliverOverlapInjector(
          handle: x.NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ReelTile(
                reel: testReels[index],
              );
            },
            childCount: testReels.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 0.5,
          ),
        ),
      ],
    );
  }
}
