const _kPhotosPath = 'https://github.com/anemchinova/404fest_flutter/blob/main/instagram_photos/';

const testReels = <InstagramReelData>[
  InstagramReelData(
    viewsCount: 1757,
    coverUrl: '$_kPhotosPath/01.png?raw=true',
  ),
  InstagramReelData(
    viewsCount: 12400,
    coverUrl: '$_kPhotosPath/02.jpg?raw=true',
  ),
  InstagramReelData(
    viewsCount: 2792,
    coverUrl: '$_kPhotosPath/03.png?raw=true',
  ),
  InstagramReelData(
    viewsCount: 1528,
    coverUrl: '$_kPhotosPath/04.png?raw=true',
  ),
  InstagramReelData(
    viewsCount: 2027,
    coverUrl: '$_kPhotosPath/05.jpg?raw=true',
  ),
  InstagramReelData(
    viewsCount: 2608,
    coverUrl: '$_kPhotosPath/06.jpg?raw=true',
  ),
];

class InstagramReelData {
  const InstagramReelData({
    required this.viewsCount,
    required this.coverUrl,
  });

  final int viewsCount;
  final String coverUrl;
}
