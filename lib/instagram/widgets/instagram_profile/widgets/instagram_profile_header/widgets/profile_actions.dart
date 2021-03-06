import 'dart:math';

import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/profile_buttons_bar.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/suggestions_section.dart';
import 'package:flutter/material.dart';

class ProfileActions extends StatefulWidget {
  const ProfileActions({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  _ProfileActionsState createState() => _ProfileActionsState();
}

class _ProfileActionsState extends State<ProfileActions> with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> _suggestionsVisibilityListenable = ValueNotifier<bool>(false);

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
    var padding = widget.padding;
    var horizontalPadding = EdgeInsets.only(
      left: padding.left,
      right: padding.right,
    );
    var verticalPadding = EdgeInsets.only(
      top: padding.top,
      bottom: padding.bottom,
    );

    return Padding(
      padding: verticalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: horizontalPadding,
            child: ProfileButtonBar(
              onSuggestionsButtonPressed: () {
                var currentValue = _suggestionsVisibilityListenable.value;
                _suggestionsVisibilityListenable.value = !currentValue;
              },
              suggestionButtonIconAnimation: _suggestionButtonIconAnimation,
            ),
          ),
          SizeTransition(
            sizeFactor: _suggestionsSizeAnimationController,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SuggestionsSection(
                padding: horizontalPadding,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
