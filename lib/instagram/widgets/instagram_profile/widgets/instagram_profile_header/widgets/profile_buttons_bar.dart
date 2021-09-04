import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/contact_button.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/following_button.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/message_button.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/suggestions_button.dart';
import 'package:flutter/material.dart';

class ProfileButtonBar extends StatelessWidget {
  const ProfileButtonBar({
    Key? key,
    required this.onSuggestionsButtonPressed,
    required this.suggestionButtonIconAnimation,
  }) : super(key: key);

  final VoidCallback onSuggestionsButtonPressed;
  final Animation<double> suggestionButtonIconAnimation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FollowingButton(
            onPressed: () {},
          ),
        ),
        const HorizontalSpace(5),
        Expanded(
          child: MessageButton(
            onPressed: () {},
          ),
        ),
        const HorizontalSpace(5),
        Expanded(
          child: ContactButton(
            onPressed: () {},
          ),
        ),
        const HorizontalSpace(5),
        SuggestionsButton(
          onPressed: onSuggestionsButtonPressed,
          iconAngleAnimation: suggestionButtonIconAnimation,
        ),
      ],
    );
  }
}
