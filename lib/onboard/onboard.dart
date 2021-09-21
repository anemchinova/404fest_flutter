import 'package:flutter/material.dart';

import 'package:fest404/onboard/widgets/cuberto_app_bar.dart';
import 'package:fest404/onboard/widgets/cuberto_onboard/cuberto_onboard.dart';
import 'package:fest404/onboard/widgets/cuberto_page.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CubertoAppBar(),
      extendBodyBehindAppBar: true,
      body: CubertoOnboard(
        colors: const [
          Colors.lightBlue,
          Colors.deepPurple,
          Colors.pinkAccent,
          Colors.teal,
        ],
        children: const [
          CubertoPage(
            icon: Icon(Icons.ac_unit),
            title: 'First page',
          ),
          CubertoPage(
            icon: Icon(Icons.access_alarm_outlined),
            title: 'Second page',
          ),
          CubertoPage(
            icon: Icon(Icons.perm_contact_cal_outlined),
            title: 'Third page',
          ),
          CubertoPage(
            icon: Icon(Icons.zoom_out_map_rounded),
            title: 'Forth page',
          ),
        ],
      ),
    );
  }
}
