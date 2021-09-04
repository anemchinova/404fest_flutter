import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/instagram_profile_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/suggestion_tile.dart';
import 'package:flutter/material.dart';

class SuggestionsCarousel extends StatelessWidget {
  const SuggestionsCarousel({Key? key, required this.suggestions}) : super(key: key);

  final List<InstagramProfileData> suggestions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SuggestionTile(
            userProfile: suggestions[index],
          );
        },
        itemCount: suggestions.length,
        padding: const EdgeInsets.only(right: 10),
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalSpace(10);
        },
      ),
    );
  }
}
