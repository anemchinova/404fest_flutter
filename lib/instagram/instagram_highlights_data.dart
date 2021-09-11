const _kHighlightsPath =
    'https://github.com/anemchinova/404fest_flutter/blob/main';

const highlightsList = <InstagramHighlightsData>[
  InstagramHighlightsData(
    name: 'Vacancies',
    coverUrl: '$_kHighlightsPath/vacancies.jpeg?raw=true',
  ),
  InstagramHighlightsData(
    name: 'Mercury PRO',
    coverUrl: '$_kHighlightsPath/pro.jpeg?raw=true',
  ),
  InstagramHighlightsData(
    name: 'Academy',
    coverUrl: '$_kHighlightsPath/academy.jpeg?raw=true',
  ),
  InstagramHighlightsData(
    name: '404FEST\'18',
    coverUrl: '$_kHighlightsPath/404.jpeg?raw=true',
  ),
];

class InstagramHighlightsData {
  const InstagramHighlightsData({
    required this.name,
    this.coverUrl,
  });

  final String name;
  final String? coverUrl;
}
