import 'package:flutter/material.dart';

import 'instagram/instagram.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '404 Demo App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const InstagramDemoPage(),
    );
  }
}
