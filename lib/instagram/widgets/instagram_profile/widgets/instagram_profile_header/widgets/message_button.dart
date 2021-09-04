import 'package:flutter/material.dart';

import '../../../../instagram_outlined_button.dart';

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
