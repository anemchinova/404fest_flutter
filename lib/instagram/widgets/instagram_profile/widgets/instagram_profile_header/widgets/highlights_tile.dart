import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/instagram_highlights_data.dart';
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
      width: 60,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: coverUrl != null ? NetworkImage(coverUrl) : null,
          ),
          const VerticalSpace(5),
          Text(
            highlightsData.name,
            style: const TextStyle(
              fontSize: 10,
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
