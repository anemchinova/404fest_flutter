import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget {
  const CirclePhoto({
    Key? key,
    required this.radius,
    this.imageUrl,
    this.decoration,
    this.padding,
  }) : super(key: key);

  const CirclePhoto.suggestionCard({
    Key? key,
    String? imageUrl,
  }) : this(key: key, imageUrl: imageUrl, radius: 40);

  CirclePhoto.avatar({
    Key? key,
    String? imageUrl,
  }) : this(
          key: key,
          imageUrl: imageUrl,
          radius: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 0.5),
          ),
          padding: const EdgeInsets.all(3),
        );

  const CirclePhoto.postAuthorAvatar({
    Key? key,
    String? imageUrl,
  }) : this(key: key, imageUrl: imageUrl, radius: 16);

  CirclePhoto.highlightsCover({
    Key? key,
    String? imageUrl,
  }) : this(
          key: key,
          radius: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 0.5),
          ),
          imageUrl: imageUrl,
          padding: const EdgeInsets.all(3),
        );

  final double radius;
  final String? imageUrl;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    var imageUrl = this.imageUrl;
    ImageProvider? image;

    if (imageUrl != null) {
      image = NetworkImage(imageUrl);
    }

    Widget circleAvatar = CircleAvatar(
      radius: radius,
      backgroundImage: image,
    );

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: decoration,
      child: circleAvatar,
    );
  }
}
