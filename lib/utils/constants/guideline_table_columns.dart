enum GuidelinesColumnEnum {
  guidelineId('guidelineId'),
  groupName('groupName'),
  lastPublishedDate('lastPublishedDate'),
  isExpired('isExpired'),
  bundle('bundle'),
  pdfUrl('pdfUrl'),
  url('url'),
  title('title'),
  fullTitle('fullTitle'),
  newArticle('new'),
  recommendationList('list');

  const GuidelinesColumnEnum(this.name);
  final String name;
}

enum ACPGuideLinesEnum {
  name,
  version,
  published,
}

enum RecommendationsColumnEnum {
  guidelineId('guidelineId'),
  title('title'),
  file('file'),
  recommendationIndex('recommendationIndex'),
  isMain('main');

  const RecommendationsColumnEnum(this.name);
  final String name;
}

const String stringDelimiter = " | ";
const Duration animateToDuration = Duration(milliseconds: 200);
