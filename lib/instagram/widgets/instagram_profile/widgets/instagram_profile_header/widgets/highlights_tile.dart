import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/data/instagram_highlights_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/circle_photo.dart';
import 'package:flutter/material.dart';

class HighlightsTile extends StatelessWidget {
  const HighlightsTile({
    Key? key,
    required this.highlightsData,
  }) : super(key: key);

  final InstagramHighlightsData highlightsData;

  @override
  Widget build(BuildContext context) {
    var coverUrl = highlightsData.coverUrl;

    return SizedBox(
      width: 75,
      child: Column(
        children: [
          CirclePhoto.highlightsCover(imageUrl: coverUrl),
          const VerticalSpace(5),
          Text(
            highlightsData.name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.2,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
