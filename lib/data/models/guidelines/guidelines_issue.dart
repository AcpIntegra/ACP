import 'package:acp_app/utils/constants/guideline_table_columns.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class ACPGuideLines {
  final String name;
  final double version;
  final List<GuideLinesIssue> issuesList;
  final DateTime published;
  ACPGuideLines(
      {required this.name,
      required this.issuesList,
      required this.version,
      required this.published});
  factory ACPGuideLines.empty() => ACPGuideLines(
      name: '', issuesList: [], version: 0, published: DateTime.now());
  factory ACPGuideLines.fromJson(Map<String, dynamic> json) => ACPGuideLines(
      name: json['name'],
      issuesList: (json['issues'] as List<dynamic>)
          .map((e) => GuideLinesIssue.fromJson(e))
          .toList(),
      version: double.parse(json['version']),
      published: DateTime.parse(json['published']));
}

class GuideLinesIssue {
  final String guidelineId;
  final String group;
  final DateTime lastPublishedDate;
  final bool isExpired;
  final String bundle;
  final String pdfUrl;
  final String url;
  final String title;
  final String fullTitle;
  final bool newArticle;
  List<Recommendations> recommendationList;

  GuideLinesIssue(
      {required this.bundle,
      required this.title,
      required this.fullTitle,
      required this.group,
      required this.guidelineId,
      required this.isExpired,
      required this.lastPublishedDate,
      required this.pdfUrl,
      required this.url,
      required this.newArticle,
      required this.recommendationList});
  factory GuideLinesIssue.fromJson(Map<String, dynamic> json) =>
      GuideLinesIssue(
          guidelineId: json['id'] is String
              ? json['id']
              : json[GuidelinesColumnEnum.guidelineId.name] ?? '',
          group:
              json['group'] ?? json[GuidelinesColumnEnum.groupName.name] ?? '',
          title: json['title'] ?? '',
          fullTitle: json['fullTitle'] ?? '',
          lastPublishedDate: DateTime.parse(
              json['lastPublishedDate'] ?? DateTime.now().toString()),
          isExpired: json['isExpired'] is String
              ? bool.parse(json[GuidelinesColumnEnum.isExpired.name])
              : json['isExpired'],
          bundle: json['bundle'] ?? '',
          pdfUrl: json['pdfUrl'] ?? '',
          url: json['url'] ?? '',
          newArticle: json['new'] is String
              ? bool.parse(json[GuidelinesColumnEnum.newArticle.name])
              : json['new'] ?? false,
          recommendationList:
              json[GuidelinesColumnEnum.recommendationList.name] ?? []);
}

class Recommendations {
  String guidelineId;
  Document htmlDocument;
  String title;
  bool isMain;
  int recommendationIndex;

  Recommendations(
      {required this.guidelineId,
      required this.htmlDocument,
      required this.title,
      required this.isMain,
      required this.recommendationIndex});

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      Recommendations(
          recommendationIndex:
              json[RecommendationsColumnEnum.recommendationIndex.name],
          title: json[RecommendationsColumnEnum.title.name],
          guidelineId: json[RecommendationsColumnEnum.guidelineId.name],
          htmlDocument: parse(json[RecommendationsColumnEnum.file.name]),
          isMain: json[RecommendationsColumnEnum.isMain.name] is String
              ? bool.parse(json[RecommendationsColumnEnum.isMain.name])
              : false);

  factory Recommendations.empty() => Recommendations(
      recommendationIndex: -1,
      guidelineId: '',
      htmlDocument: Document(),
      title: '',
      isMain: false);
}
