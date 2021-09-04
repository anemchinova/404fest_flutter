const highlightsList = <InstagramHighlightsData>[
  InstagramHighlightsData(
    name: 'Vacancies',
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/s150x150/229571085_255750156126126_8995536466561452307_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_ohc=1h3ozduTwp0AX-NFAeO&edm=AGW0Xe4BAAAA&ccb=7-4&oh=7bd0d3d92e1e3ffb6d38a7e813e575b4&oe=613A3E5F&_nc_sid=acd11b',
  ),
  InstagramHighlightsData(
    name: 'Mercury PRO',
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/s150x150/75601612_150350706322912_8079105134061813178_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_ohc=wZ3sz28Bq8QAX9lm1wE&edm=AGW0Xe4BAAAA&ccb=7-4&oh=12254cf698689f67bc24fe4de99e332f&oe=613B52FB&_nc_sid=acd11b',
  ),
  InstagramHighlightsData(
    name: 'Academy',
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/s150x150/229760578_953837518791657_5123313521819128005_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_ohc=Y1HXD16EiAAAX9xgwN5&edm=AGW0Xe4BAAAA&ccb=7-4&oh=c008ae12c130efc532fa0bd47a7284d2&oe=613B4357&_nc_sid=acd11b',
  ),
  InstagramHighlightsData(
    name: '404FEST\'18',
    coverUrl:
        'https://scontent-hel3-1.cdninstagram.com/v/t51.2885-15/s150x150/60880379_364344251105199_5154573079965637819_n.jpg?_nc_ht=scontent-hel3-1.cdninstagram.com&_nc_ohc=l-ZPZBCBeQUAX9l_qQq&edm=AGW0Xe4BAAAA&ccb=7-4&oh=79f2253a7757bfe5a9ad4154921b9748&oe=613A06E2&_nc_sid=acd11b',
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
