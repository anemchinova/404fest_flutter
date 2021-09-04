import 'dart:math';

import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/instagram_profile_header/widgets/suggestions_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'widgets/profile_buttons_bar.dart';
import 'widgets/profile_description.dart';
import 'widgets/profile_infographics.dart';
import 'widgets/stories_carousel.dart';

class InstagramProfileHeader extends StatelessWidget {
  const InstagramProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: const [
        SliverToBoxAdapter(
          child: _BaseProfileHeader(),
        ),
        SliverPinnedHeader(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
            child: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.photo_library)),
                Tab(icon: Icon(Icons.assignment_ind_outlined)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BaseProfileHeader extends StatefulWidget {
  const _BaseProfileHeader({Key? key}) : super(key: key);

  @override
  __BaseProfileHeaderState createState() => __BaseProfileHeaderState();
}

class __BaseProfileHeaderState extends State<_BaseProfileHeader> with SingleTickerProviderStateMixin {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const ProfileInfographics(),
          const ProfileDescription(),
          const VerticalSpace(20),
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
          const StoriesCarousel(),
        ],
      ),
    );
  }
}
