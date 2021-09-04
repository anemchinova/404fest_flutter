const testInstagramProfile = InstagramProfileData(
  name: 'Mercury Development',
  username: 'mercdev',
  postsCount: 142,
  followersCount: 2050,
  followingsCount: 887,
  bio: """🚀 Приложения для техно-стартапов и собственные продукты
👥 50 миллионов пользователей по всему миру
💈 404fest, митапы и стажировки для разработчиков
mercdev.ru/links""",
  avatarUrl:
      'https://media-exp1.licdn.com/dms/image/C560BAQHAoDg0ETWEPw/company-logo_200_200/0/1588791475575?e=2159024400&v=beta&t=-pSUjkpcwmJp6tbmj1X_NgNJr8jxHfvxayufkTAgP9A',
);

const alenaNemchinovaProfile = InstagramProfileData(
  name: 'Alena Nemchinova',
  username: 'al.nemchinova',
  avatarUrl:
      'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-19/s150x150/164043362_124342206369372_8119948234541846958_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_ohc=Icmwz5DLM2AAX-czQF-&edm=ABfd0MgBAAAA&ccb=7-4&oh=2a686e580dbcf765d60964beab88e983&oe=61396A42&_nc_sid=7bff83',
);

const artemKruppProfile = InstagramProfileData(
  name: 'Artem Krupp',
  username: 'artemintheskyy',
  avatarUrl:
      'https://instagram.fcai2-2.fna.fbcdn.net/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=instagram.fcai2-2.fna.fbcdn.net&_nc_ohc=EVduJdyGDrIAX-P4RKz&edm=ALlQn9MBAAAA&ccb=7-4&oh=c9cf52eb89967bb91a4183aa8710cb5e&oe=61396E0F&_nc_sid=48a2a6&ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2-ccb7-4',
);

const sergeyLavinovProfile = InstagramProfileData(
  name: 'Sergey Lavinov',
  username: 'jump_stalder',
  avatarUrl:
      'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-19/s150x150/12568326_682990025177069_1283156764_a.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_ohc=xqt2Un7uTaEAX_-bzKp&edm=ABfd0MgBAAAA&ccb=7-4&oh=2cbbc438118bfaed06a7194050e39f84&oe=613962A9&_nc_sid=7bff83',
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
