import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/instagram_highlights_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/highlights_tile.dart';
import 'package:flutter/material.dart';

class HighlightsCarousel extends StatelessWidget {
  const HighlightsCarousel({
    Key? key,
    required this.highlights,
  }) : super(key: key);

  final List<InstagramHighlightsData> highlights;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
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
      ),
    );
  }
}
