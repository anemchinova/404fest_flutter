import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/instagram_highlights_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/highlights_tile.dart';
import 'package:flutter/material.dart';

class HighlightsCarousel extends StatelessWidget {
  const HighlightsCarousel({
    Key? key,
    required this.highlights,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final List<InstagramHighlightsData> highlights;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    var verticalPadding = EdgeInsets.only(
      top: padding.top,
      bottom: padding.bottom,
    );

    var horizontalPadding = EdgeInsets.only(
      left: padding.left,
      right: padding.right,
    );

    return Padding(
      padding: verticalPadding,
      child: SizedBox(
        height: 90,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return HighlightsTile(
              highlightsData: highlights[index],
            );
          },
          separatorBuilder: (context, index) {
            return const HorizontalSpace(10);
          },
          itemCount: highlights.length,
          padding: horizontalPadding,
        ),
      ),
    );
  }
}
