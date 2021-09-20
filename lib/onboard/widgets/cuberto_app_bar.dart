import 'package:flutter/widgets.dart';

class CubertoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CubertoAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: preferredSize.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('404 fest'),
              Text('Skip'),
            ],
          ),
        ),
      ),
    );
  }
}
