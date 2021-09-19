import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/data/instagram_profile_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/suggestion_tile.dart';
import 'package:flutter/material.dart';

class SuggestionsCarousel extends StatelessWidget {
  const SuggestionsCarousel({
    Key? key,
    required this.suggestions,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final List<InstagramProfileData> suggestions;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SuggestionTile(
            userProfile: suggestions[index],
          );
        },
        itemCount: suggestions.length,
        padding: padding,
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalSpace(10);
        },
      ),
    );
  }
}
