import 'package:flutter/material.dart';

import 'widgets/instagram_fake_bottom_bar.dart';
import 'widgets/instagram_profile/instagram_profile.dart';
import 'widgets/instagram_profile_app_bar.dart';

class InstagramDemoPage extends StatelessWidget {
  const InstagramDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: InstagramProfileAppBar(),
      body: InstagramProfile(),
      bottomNavigationBar: InstagramFakeBottomBar(),
    );
  }
}
