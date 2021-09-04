import 'package:fest404/instagram/instagram_profile_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/suggestions_carousel.dart';
import 'package:flutter/material.dart';

class SuggestionsSection extends StatelessWidget {
  const SuggestionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Suggested for you',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SuggestionsCarousel(
            suggestions: [
              alenaNemchinovaProfile,
              sergeyLavinovProfile,
              artemKruppProfile,
            ],
          ),
        ),
      ],
    );
  }
}
