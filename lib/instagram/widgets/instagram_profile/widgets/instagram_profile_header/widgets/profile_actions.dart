import 'dart:math';

import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/profile_buttons_bar.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/suggestions_section.dart';
import 'package:flutter/material.dart';

class ProfileActions extends StatefulWidget {
  const ProfileActions({Key? key}) : super(key: key);

  @override
  _ProfileActionsState createState() => _ProfileActionsState();
}

class _ProfileActionsState extends State<ProfileActions> with SingleTickerProviderStateMixin {
  final ValueNotifier _suggestionsVisibilityListenable = ValueNotifier<bool>(false);

  late AnimationController _suggestionsSizeAnimationController;
  late Animation<double> _suggestionButtonIconAnimation;

  @override
  void initState() {
    super.initState();
    _suggestionsSizeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _suggestionButtonIconAnimation = Tween(begin: 0.0, end: pi).animate(_suggestionsSizeAnimationController);

    _suggestionsVisibilityListenable.addListener(() {
      var isSuggestionsVisible = _suggestionsVisibilityListenable.value;

      if (isSuggestionsVisible) {
        _suggestionsSizeAnimationController.forward();
      } else {
        _suggestionsSizeAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _suggestionsSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileButtonBar(
          onSuggestionsButtonPressed: () {
            var currentValue = _suggestionsVisibilityListenable.value;
            _suggestionsVisibilityListenable.value = !currentValue;
          },
          suggestionButtonIconAnimation: _suggestionButtonIconAnimation,
        ),
        const VerticalSpace(20),
        SizeTransition(
          sizeFactor: _suggestionsSizeAnimationController,
          child: const SuggestionsSection(),
        ),
      ],
    );
  }
}
