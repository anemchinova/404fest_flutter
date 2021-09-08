import 'package:fest404/instagram/instagram_profile_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/suggestions_carousel.dart';
import 'package:flutter/material.dart';

class SuggestionsSection extends StatelessWidget {
  const SuggestionsSection({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: horizontalPadding,
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Suggested for you',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SuggestionsCarousel(
              suggestions: const [
                alenaNemchinovaProfile,
                sergeyLavinovProfile,
                artemKruppProfile,
              ],
              padding: horizontalPadding,
            ),
          ),
        ],
      ),
    );
  }
}
