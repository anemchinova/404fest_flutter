import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InstagramPostFooter extends StatelessWidget {
  const InstagramPostFooter({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  String get _formattedDate => DateFormat.MMMMd().format(post.dateTime);

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedDate,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );
  }
}
