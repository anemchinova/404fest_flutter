import 'package:flutter/material.dart';

class ReelsTabContent extends StatelessWidget {
  const ReelsTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.5,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.accents[(index + 5) % Colors.accents.length],
        );
      },
    );
  }
}
