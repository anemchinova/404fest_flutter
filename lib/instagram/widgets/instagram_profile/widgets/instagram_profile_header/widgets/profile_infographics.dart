import 'package:fest404/instagram/instagram_profile_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileInfographics extends StatelessWidget {
  const ProfileInfographics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<InstagramProfileData>(context);

    var avatarUrl = profile.avatarUrl;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 42,
          backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatColumn(label: 'Posts', value: profile.postsCount),
              _StatColumn(label: 'Followers', value: profile.followersCount),
              _StatColumn(label: 'Following', value: profile.followingsCount),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.value,
    required this.label,
    Key? key,
  }) : super(key: key);

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
