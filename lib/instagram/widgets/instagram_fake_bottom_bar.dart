import 'package:flutter/material.dart';

class InstagramFakeBottomBar extends StatelessWidget {
  const InstagramFakeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icons.home_outlined,
              Icons.search_outlined,
              Icons.movie_outlined,
              Icons.favorite_border,
              Icons.person,
            ].map((icon) => Icon(icon, size: 30)).toList(),
          ),
        ),
      ),
    );
  }
}
