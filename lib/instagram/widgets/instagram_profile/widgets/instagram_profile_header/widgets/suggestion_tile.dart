import 'package:fest404/instagram/instagram_profile_data.dart';
import 'package:fest404/instagram/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SuggestionTile extends StatelessWidget {
  const SuggestionTile({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  final InstagramProfileData userProfile;

  @override
  Widget build(BuildContext context) {
    var avatarUrl = userProfile.avatarUrl;

    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.grey, width: 0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
          ),
          Text(
            userProfile.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            userProfile.username,
            style: const TextStyle(
              color: Colors.white30,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          PrimaryButton(
            child: const Text('Follow'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
