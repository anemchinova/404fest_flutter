import 'package:flutter/material.dart';

class MentionsTabContent extends StatelessWidget {
  const MentionsTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              color: Colors.accents[(index + 5) % Colors.accents.length],
              child: Text('$index'),
            ),
            childCount: 50,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
        ),
      ],
    );
  }
}
