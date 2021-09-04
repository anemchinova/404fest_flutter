import 'package:fest404/instagram/instagram_highlights_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/stories_carousel.dart';
import 'package:flutter/material.dart';


class HighlightsSection extends StatelessWidget {
  const HighlightsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StoriesCarousel(highlights: highlightsList);
  }
}
