import 'package:flutter/material.dart';

class InstagramFakeBottomBar extends StatelessWidget {
  const InstagramFakeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.home_outlined, size: 30),
              Icon(Icons.search_outlined, size: 30),
              Icon(Icons.movie_outlined, size: 30),
              Icon(Icons.favorite_border, size: 30),
              Icon(Icons.person, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
