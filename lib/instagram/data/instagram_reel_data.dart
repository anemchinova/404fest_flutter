const testReels = <InstagramReelData>[
  InstagramReelData(
    viewsCount: 1757,
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/e35/241085146_875058410072018_331316061035432027_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_cat=102&_nc_ohc=eXSaxHjzvi8AX8ja184&edm=ACHbZRIBAAAA&ccb=7-4&oh=0ee54117766b310ba3b40cffdf440bb3&oe=613B9D5A&_nc_sid=4a9e64&ig_cache_key=MjY1NDU4OTA4NzgzNjAxMTU3Mw%3D%3D.2-ccb7-4',
  ),
  InstagramReelData(
    viewsCount: 12400,
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/e35/223265444_543827823411780_3376059603558679856_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_cat=100&_nc_ohc=LxLwTvXKdOIAX9VGGxv&edm=ACHbZRIBAAAA&ccb=7-4&oh=c8f33fcae2832b988a692a57d009eff0&oe=613BC6D9&_nc_sid=4a9e64&ig_cache_key=MjYyNjI0NDA0NzMyMjM1Mjk5Ng%3D%3D.2-ccb7-4',
  ),
  InstagramReelData(
    viewsCount: 2792,
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/e35/209407717_348536946854564_7231856825835416380_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_cat=108&_nc_ohc=mod6FNP2NmUAX-AspjL&edm=ACHbZRIBAAAA&ccb=7-4&oh=93fc4a3006f4ac398aacf87a4b29547f&oe=613B49C6&_nc_sid=4a9e64&ig_cache_key=MjYwODgwMTEyNDYwMzQyMzgwNQ%3D%3D.2-ccb7-4',
  ),
  InstagramReelData(
    viewsCount: 1528,
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/e35/210044166_761981414496880_2670834637524048727_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_cat=104&_nc_ohc=BNpEpleekAsAX9_lHpo&edm=ACHbZRIBAAAA&ccb=7-4&oh=224d85c6bcbc1b0f0e63ed9ecfbc2ad6&oe=613B75AA&_nc_sid=4a9e64&ig_cache_key=MjYwODEyMzQ2NDE5MzczNjA1Ng%3D%3D.2-ccb7-4',
  ),
  InstagramReelData(
    viewsCount: 2027,
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/e35/209907426_495005795093203_6297929616159219018_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_cat=107&_nc_ohc=PLGtglpSUaAAX-Mz1uK&edm=ACHbZRIBAAAA&ccb=7-4&oh=733b315d19ae46c1ca82682fa971aa0a&oe=613C3AE2&_nc_sid=4a9e64&ig_cache_key=MjYwNjYzOTkxODQwOTE0NDQ3OA%3D%3D.2-ccb7-4',
  ),
  InstagramReelData(
    viewsCount: 2608,
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/e35/207265141_485874032473604_224430581561538692_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_cat=108&_nc_ohc=KnIAssovAZMAX-YG2Vx&edm=ACHbZRIBAAAA&ccb=7-4&oh=db9214f9e645b4c3e10bb01a76b8b953&oe=613C9225&_nc_sid=4a9e64&ig_cache_key=MjYwMjQ1NDU0MTAyMDY3NTYwNw%3D%3D.2-ccb7-4',
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
