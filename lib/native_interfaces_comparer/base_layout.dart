import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    Key? key,
    required this.switcher,
    required this.button,
    required this.textButton,
    required this.textField,
    required this.slider,
  }) : super(key: key);

  final Widget switcher;
  final Widget button;
  final Widget textButton;
  final Widget textField;
  final Widget slider;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: textField,
            ),
          ),
          Expanded(
            child: Center(
              child: switcher,
            ),
          ),
          Expanded(
            child: Center(
              child: button,
            ),
          ),
          Expanded(
            child: Center(
              child: textButton,
            ),
          ),
          Expanded(
            child: Center(
              child: slider,
            ),
          ),
        ],
      ),
    );
  }
}
