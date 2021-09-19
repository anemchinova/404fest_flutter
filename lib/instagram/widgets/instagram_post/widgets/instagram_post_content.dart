import 'package:cached_network_image/cached_network_image.dart';
import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramPostContent extends StatelessWidget {
  const InstagramPostContent({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CachedNetworkImage(imageUrl: post.coverUrl, memCacheWidth: width.toInt());
  }
}
