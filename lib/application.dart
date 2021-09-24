import 'package:fest404/instagram/data/instagram_profile_data.dart';
import 'package:fest404/instagram/widgets/instagram_profile/instagram_profile_page.dart';
import 'package:fest404/native_interfaces_comparer/native_interface_comparer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: mercuryProfile,
      child: MaterialApp(
        title: '404 Demo App',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: child ?? const SizedBox(),
          );
        },
        home: const InstagramProfilePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
