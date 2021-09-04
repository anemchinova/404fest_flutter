import 'package:fest404/instagram/instagram_highlights_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/highlights_carousel.dart';
import 'package:flutter/material.dart';

class HighlightsSection extends StatelessWidget {
  const HighlightsSection({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return HighlightsCarousel(
      highlights: highlightsList,
      padding: padding,
    );
  }
}
