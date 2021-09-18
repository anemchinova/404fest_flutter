const _kProfilePath = 'https://github.com/anemchinova/404fest_flutter/blob/main/instagram_photos/';

const testInstagramProfile = InstagramProfileData(
  name: 'Mercury Development',
  username: 'mercdev',
  postsCount: 142,
  followersCount: 2050,
  followingsCount: 887,
  bio: '''🚀 Приложения для техно-стартапов и собственные продукты
👥 50 миллионов пользователей по всему миру
💈 404fest, митапы и стажировки для разработчиков
mercdev.ru/links''',
  avatarUrl:
      'https://media-exp1.licdn.com/dms/image/C560BAQHAoDg0ETWEPw/company-logo_200_200/0/1588791475575?e=2159024400&v=beta&t=-pSUjkpcwmJp6tbmj1X_NgNJr8jxHfvxayufkTAgP9A',
);

const alenaNemchinovaProfile = InstagramProfileData(
  name: 'Alena Nemchinova',
  username: 'al.nemchinova',
  avatarUrl: '$_kProfilePath/alena.jpg?raw=true',
);

const artemKruppProfile = InstagramProfileData(
  name: 'Artem Krupp',
  username: 'artemintheskyy',
  avatarUrl: '$_kProfilePath/artem.jpg?raw=true',
);

const sergeyLavinovProfile = InstagramProfileData(
  name: 'Sergey Lavinov',
  username: 'jump_stalder',
  avatarUrl: '$_kProfilePath/sergey.jpg?raw=true',
);

class InstagramProfileData {
  const InstagramProfileData({
    required this.name,
    required this.username,
    this.postsCount = 0,
    this.followersCount = 0,
    this.followingsCount = 0,
    this.avatarUrl,
    this.bio,
  });

  final String? avatarUrl;
  final String name;
  final String username;
  final String? bio;
  final int postsCount;
  final int followersCount;
  final int followingsCount;
}
