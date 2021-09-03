import 'package:flutter/material.dart';

class InstagramProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const InstagramProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: preferredSize.height,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mercury Employee',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: const [
                    Icon(Icons.plus_one_outlined),
                    SizedBox(width: 24),
                    Icon(Icons.menu),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
