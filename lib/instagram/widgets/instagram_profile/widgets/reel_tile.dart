import 'package:fest404/instagram/instagram_reel_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReelTile extends StatelessWidget {
  const ReelTile({
    Key? key,
    required this.reel,
  }) : super(key: key);

  final InstagramReelData reel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox.expand(
          child: Image(
            image: NetworkImage(reel.coverUrl),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.play_arrow_solid,
                size: 16,
              ),
              Text(
                reel.viewsCount.toString(),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
