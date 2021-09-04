import 'dart:math';

import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/instagram/instagram_profile_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/widgets/suggestion_tile.dart';
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
          SizeTransition(
            sizeFactor: _suggestionsSizeAnimationController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(20),
                const Text(
                  'Suggested for you',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 140,
                      child: Row(
                        children: [
                          SuggestionTile(
                            userProfile: InstagramProfileData(
                              name: 'Alena Nemchinova',
                              username: 'al.nemchinova',
                              avatarUrl:
                                  'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-19/s150x150/164043362_124342206369372_8119948234541846958_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_ohc=Icmwz5DLM2AAX-czQF-&edm=ABfd0MgBAAAA&ccb=7-4&oh=2a686e580dbcf765d60964beab88e983&oe=61396A42&_nc_sid=7bff83',
                            ),
                          ),
                          const HorizontalSpace(10),
                          SuggestionTile(
                            userProfile: InstagramProfileData(
                              name: 'Sergey Lavinov',
                              username: 'jump_stalder',
                              avatarUrl:
                                  'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-19/s150x150/12568326_682990025177069_1283156764_a.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_ohc=xqt2Un7uTaEAX_-bzKp&edm=ABfd0MgBAAAA&ccb=7-4&oh=2cbbc438118bfaed06a7194050e39f84&oe=613962A9&_nc_sid=7bff83',
                            ),
                          ),
                          const HorizontalSpace(10),
                          SuggestionTile(
                            userProfile: InstagramProfileData(
                              name: 'Artem Krupp',
                              username: 'artemintheskyy',
                              avatarUrl:
                                  'https://instagram.fcai2-2.fna.fbcdn.net/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=instagram.fcai2-2.fna.fbcdn.net&_nc_ohc=EVduJdyGDrIAX-P4RKz&edm=ALlQn9MBAAAA&ccb=7-4&oh=c9cf52eb89967bb91a4183aa8710cb5e&oe=61396E0F&_nc_sid=48a2a6&ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2-ccb7-4',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const StoriesCarousel(),
        ],
      ),
    );
  }
}
