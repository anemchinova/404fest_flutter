import 'package:fest404/instagram/widgets/instagram_outlined_button.dart';
import 'package:flutter/material.dart';

@immutable
class FollowingButton extends StatelessWidget {
  const FollowingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InstagramOutlinedButton(
      onPressed: onPressed,
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Following'),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
