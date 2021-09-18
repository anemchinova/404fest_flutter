const _kPhotosPath =
    'https://github.com/anemchinova/404fest_flutter/blob/main/instagram_photos/';

const instagramTestPosts = <InstagramPostData>[
  InstagramPostData(
    coverUrl: '$_kPhotosPath/01.jpg?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/02.jpg?raw=true',
    type: InstagramPostDataType.video,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/03.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/04.png?raw=true',
    type: InstagramPostDataType.video,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/05.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/06.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/07.png?raw=true',
    type: InstagramPostDataType.photo,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/08.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/09.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/10.jpg?raw=true',
    type: InstagramPostDataType.photo,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/11.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: '$_kPhotosPath/12.png?raw=true',
    type: InstagramPostDataType.album,
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
  });

  final String coverUrl;
  final InstagramPostDataType type;
}
