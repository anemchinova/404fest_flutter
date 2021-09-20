import 'package:fest404/instagram/data/instagram_profile_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<InstagramProfileData>(context);

    var bio = profile.bio;

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profile.name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (bio != null)
            Text(
              bio,
              style: const TextStyle(
                fontSize: 13,
                height: 1.35,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}
