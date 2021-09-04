import 'package:fest404/instagram/instagram_profile_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/instagram_fake_bottom_bar.dart';
import 'widgets/instagram_profile/instagram_profile.dart';
import 'widgets/instagram_profile_app_bar.dart';

class InstagramDemoPage extends StatelessWidget {
  const InstagramDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = testInstagramProfile;

    return Provider<InstagramProfileData>.value(
      value: profile,
      child: const Scaffold(
        backgroundColor: Colors.black,
        appBar: InstagramProfileAppBar(),
        body: InstagramProfile(),
        bottomNavigationBar: InstagramFakeBottomBar(),
      ),
    );
  }
}
