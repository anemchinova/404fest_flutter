import 'package:fest404/instagram/widgets/instagram_fake_bottom_bar.dart';
import 'package:fest404/instagram/widgets/instagram_profile/instagram_profile.dart';
import 'package:fest404/instagram/widgets/instagram_profile_app_bar.dart';
import 'package:flutter/material.dart';

class InstagramProfilePage extends StatelessWidget {
  const InstagramProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: InstagramProfileAppBar(),
      body: InstagramProfile(),
      bottomNavigationBar: InstagramFakeBottomBar(),
    );
  }
}
