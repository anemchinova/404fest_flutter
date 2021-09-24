import 'package:cached_network_image/cached_network_image.dart';
import 'package:fest404/instagram/data/instagram_post_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramPostContent extends StatefulWidget {
  const InstagramPostContent({
    Key? key,
    required this.post,
  }) : super(key: key);

  final InstagramPostData post;

  @override
  State<InstagramPostContent> createState() => _InstagramPostContentState();
}

class _InstagramPostContentState extends State<InstagramPostContent>
    with SingleTickerProviderStateMixin<InstagramPostContent> {
  late AnimationController animationController;

  void showHeart() async {
    await animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 150));
    await animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      reverseDuration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onDoubleTap: showHeart,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: widget.post.coverUrl,
            memCacheWidth: width.toInt(),
          ),
          Positioned.fill(
            child: _InstagramAnimatedIcon(
              animationController: animationController,
              child: Icon(
                CupertinoIcons.heart_fill,
                size: width * 0.25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InstagramAnimatedIcon extends StatelessWidget {
  _InstagramAnimatedIcon({
    Key? key,
    required this.animationController,
    required this.child,
  }) : super(key: key);

  final AnimationController animationController;
  final Widget child;

  late final Animation<double> _opacity = CurvedAnimation(
    parent: Tween(begin: 0.0, end: 1.0).animate(animationController),
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeOutCubic,
  );
  late final Animation<double> _scale = CurvedAnimation(
    parent: Tween(begin: 0.0, end: 1.0).animate(animationController),
    curve: Curves.elasticOut,
    reverseCurve: Curves.elasticOut,
  );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: ScaleTransition(
        scale: _scale,
        child: child,
      ),
    );
  }
}
