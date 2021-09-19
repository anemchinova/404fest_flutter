import 'package:fest404/instagram/data/instagram_profile_data.dart';
import 'package:fest404/instagram/widgets/instagram_fake_bottom_bar.dart';
import 'package:fest404/instagram/widgets/instagram_profile/instagram_profile.dart';
import 'package:fest404/instagram/widgets/instagram_profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
