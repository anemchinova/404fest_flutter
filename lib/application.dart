import 'package:fest404/instagram/data/instagram_profile_data.dart';
import 'package:fest404/onboard/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: mercuryProfile,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: MaterialApp(
          title: '404 Demo App',
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
          ),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: child ?? const SizedBox(),
            );
          },
          home: const OnboardScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
