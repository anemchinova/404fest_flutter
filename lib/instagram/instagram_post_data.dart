const instagramTestPosts = <InstagramPostData>[
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/01.jpg?raw=true',
    type: InstagramPostDataType.reel,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/02.jpg?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/03.png?raw=true',
    type: InstagramPostDataType.video,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/04.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/05.png?raw=true',
    type: InstagramPostDataType.video,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/06.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/07.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/08.png?raw=true',
    type: InstagramPostDataType.album,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/09.png?raw=true',
    type: InstagramPostDataType.photo,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/10.jpg?raw=true',
    type: InstagramPostDataType.photo,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/11.png?raw=true',
    type: InstagramPostDataType.video,
  ),
  InstagramPostData(
    coverUrl: 'https://github.com/anemchinova/404fest_flutter/blob/nemchinova/photos/instagram_photos/12.png?raw=true',
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
