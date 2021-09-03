import 'package:flutter/material.dart';

class ProfileInfographics extends StatelessWidget {
  const ProfileInfographics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 44,
              backgroundImage: NetworkImage(
                'https://habrastorage.org/getpro/moikrug/uploads/company/100/006/794/8/logo/medium_e36c0be3f01adbb64b3d8c052265629d.png',
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                _StatColumn(label: 'Posts', value: 86),
                SizedBox(width: 16),
                _StatColumn(label: 'Followings', value: 96),
                SizedBox(width: 16),
                _StatColumn(label: 'Following', value: 103),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.value,
    required this.label,
    Key? key,
  }) : super(key: key);

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$value'),
        Text(label),
      ],
    );
  }
}
