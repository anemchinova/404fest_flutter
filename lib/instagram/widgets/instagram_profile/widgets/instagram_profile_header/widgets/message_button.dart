import 'package:flutter/material.dart';

import '../../../../outlined_button.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseOutlinedButton(
      onPressed: onPressed,
      child: const Text('Message'),
    );
  }
}
