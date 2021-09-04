import 'package:fest404/instagram/widgets/instagram_outlined_button.dart';
import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InstagramOutlinedButton(
      onPressed: onPressed,
      child: const Text('Message'),
    );
  }
}
