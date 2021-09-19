import 'package:fest404/instagram/data/instagram_profile_data.dart';

class InstagramCommentData {
  const InstagramCommentData({
    required this.author,
    required this.comment,
  });

  final InstagramProfileData author;
  final String comment;
}
