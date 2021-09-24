import 'package:fest404/core/widgets/widgets.dart';
import 'package:fest404/crypto_wallet/neu/neu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.deepPurple,
            ),
            const VerticalSpace(15),
            Text(
              title,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const VerticalSpace(5),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
