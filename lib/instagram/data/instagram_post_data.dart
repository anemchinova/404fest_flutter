import 'package:fest404/instagram/data/instagram_comment_data.dart';
import 'package:fest404/instagram/data/instagram_profile_data.dart';

part 'instagram_post_text.dart';

const _kPhotosPath = 'https://github.com/anemchinova/404fest_flutter/blob/main/instagram_photos/';

const instagramTestPosts = <InstagramPostData>[
  InstagramPostData(
    coverUrl: '$_kPhotosPath/01.png?raw=true',
    type: InstagramPostDataType.album,
    author: mercuryProfile,
    formattedDateTime: '2021-09-01',
    description: _post01,
    totalLikeCount: 119,
    whoLiked: [artemKruppProfile, alenaNemchinovaProfile, sergeyLavinovProfile],
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/02.jpg?raw=true',
    type: InstagramPostDataType.video,
    author: mercuryProfile,
    formattedDateTime: '2021-07-29',
    description: _post02,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/03.png?raw=true',
    type: InstagramPostDataType.album,
    author: mercuryProfile,
    formattedDateTime: '2021-09-01',
    description: _post03,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/04.png?raw=true',
    type: InstagramPostDataType.video,
    author: mercuryProfile,
    formattedDateTime: '2021-06-30',
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/05.jpg?raw=true',
    type: InstagramPostDataType.album,
    author: mercuryProfile,
    formattedDateTime: '2021-06-07',
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/06.jpg?raw=true',
    type: InstagramPostDataType.album,
    author: mercuryProfile,
    formattedDateTime: '2021-06-03',
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/07.png?raw=true',
    type: InstagramPostDataType.photo,
    author: mercuryProfile,
    formattedDateTime: '2021-05-25',
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/08.png?raw=true',
    type: InstagramPostDataType.album,
    author: mercuryProfile,
    formattedDateTime: '2021-05-21',
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/09.png?raw=true',
    type: InstagramPostDataType.album,
    author: mercuryProfile,
    formattedDateTime: '2021-05-19',
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/10.png?raw=true',
    type: InstagramPostDataType.photo,
    author: mercuryProfile,
    formattedDateTime: '2021-04-29',
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/11.png?raw=true',
    type: InstagramPostDataType.album,
    author: mercuryProfile,
    formattedDateTime: '2021-04-27',
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/12.png?raw=true',
    type: InstagramPostDataType.album,
    author: mercuryProfile,
    formattedDateTime: '2021-04-24',
  ),
];

enum InstagramPostDataType {
  photo,
  album,
  video,
  reel,
}

class InstagramPostData {
  const InstagramPostData({
    required this.coverUrl,
    required this.type,
    required this.author,
    required this.formattedDateTime,
    this.description,
    this.location,
    this.isLiked = false,
    this.isSaved = false,
    this.whoLiked = const [],
    this.totalLikeCount = 0,
    this.comments = const [],
    this.totalCommentCount = 0,
  });

  final String coverUrl;
  final InstagramPostDataType type;
  final InstagramProfileData author;
  final String formattedDateTime;
  final String? description;
  final String? location;
  final bool isLiked;
  final bool isSaved;
  final List<InstagramProfileData> whoLiked;
  final int totalLikeCount;
  final List<InstagramCommentData> comments;
  final int totalCommentCount;

  DateTime get dateTime => DateTime.parse(formattedDateTime);
}
