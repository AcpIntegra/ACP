import 'dart:convert';
import 'dart:io';
import 'package:acp_app/data/models/guidelines/guidelines_issue.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/guideline_table_columns.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:html/parser.dart' as html;
import 'package:http/http.dart' as http;

class GuidelinesApi {
  static final GuidelinesApi _obj = GuidelinesApi._();
  GuidelinesApi._();
  factory GuidelinesApi() => _obj;
  final Uri uriBundle =
      Uri(scheme: 'https', host: 'apps2.acponline.org', path: "$path/$bundle");
  final Uri uriApplicationConfig = Uri(
      scheme: 'https',
      host: 'apps2.acponline.org',
      path: '$path/$applicationConfig');
  static const String applicationConfig = "application-config.json";
  static const String path = '/clinicalguidelines/ipad/production/public';
  static const String bundle = 'bundles';

  Future<ACPGuideLines> fetchGuidelinesArticle() async {
    final http.Response response = await http.get(uriApplicationConfig);
    final Map<String, dynamic> json = jsonDecode(response.body);
    final ACPGuideLines acpGuideLines = ACPGuideLines.fromJson(json);
    await DataRepository().insertInGuidelinesTable(acpGuideLines);
    Directory directory = Config().guidelinesDownloadPath;
    bool isExist = await directory.exists();
    if (isExist) {
      List<FileSystemEntity> list = directory.listSync();
      for (var item in list) {
        if (item.existsSync()) {
          await item.delete(recursive: true);
        }
      }
    }

    await Future.wait(acpGuideLines.issuesList.map((issue) async {
      Directory zipFileDirectory = await _fetchBundle(issue);
      String jsonString =
          await File("${zipFileDirectory.absolute.path}/issue.json")
              .readAsString();
      Map<String, dynamic> issueJson = jsonDecode(jsonString);
      List issueContentList = issueJson['contents'] as List<dynamic>;
      List<Recommendations> recommendationList = [];
      await Future.wait(issueContentList.map((e) async {
        Map<String, dynamic> contentMap = e as Map<String, dynamic>;
        Recommendations recommendations = await _getRecommendations(
            index: issueContentList.indexOf(e),
            contentMap: contentMap,
            isMain: issueContentList.first == e,
            zipFileDirectory: zipFileDirectory,
            issue: issue);
        recommendationList.add(recommendations);
        recommendationList.sort((r1, r2) =>
            r1.recommendationIndex.compareTo(r2.recommendationIndex));
        await DataRepository().insertRecommendations(recommendations);
      }));
      issue.recommendationList = recommendationList;
    }));
    if (isExist) {
      List<FileSystemEntity> list = directory.listSync();
      for (var item in list) {
        if (item.existsSync()) {
          await item.delete(recursive: true);
        }
      }
    }
    return acpGuideLines;
  }

  Future<Directory> _fetchBundle(GuideLinesIssue issue) async {
    final Uri uriPath =
        uriBundle.replace(path: "${uriBundle.path}/${issue.bundle}");
    String zipFile =
        issue.bundle.substring(issue.bundle.indexOf('/'), issue.bundle.length);
    String bundleName = issue.bundle.substring(0, issue.bundle.indexOf('/'));
    String zipfileDestination =
        "${Config().guidelinesDownloadPath.absolute.path}$zipFile";
    final http.Response response = await http.get(uriPath);
    File file = File(zipfileDestination);
    File download = await file.writeAsBytes(response.bodyBytes);
    Directory zipFileDirectory = Directory(
        "${Config().guidelinesDownloadPath.absolute.path}/$bundleName");
    bool zipfileDirectoryExist = await zipFileDirectory.exists();
    if (zipfileDirectoryExist) {
      await zipFileDirectory.delete(recursive: true);
    }
    zipFileDirectory = await zipFileDirectory.create();
    await ZipFile.extractToDirectory(
        zipFile: download, destinationDir: zipFileDirectory);
    return zipFileDirectory;
  }

  Future<Recommendations> _getRecommendations(
      {required int index,
      required Map<String, dynamic> contentMap,
      required bool isMain,
      required Directory zipFileDirectory,
      required GuideLinesIssue issue}) async {
    File recommendationFile = File(
        "${zipFileDirectory.absolute.path}/${contentMap[RecommendationsColumnEnum.file.name]}");
    String recommendationHtml = await recommendationFile.readAsString();
    return Recommendations(
        recommendationIndex: index,
        guidelineId: issue.guidelineId,
        htmlDocument: html.parse(recommendationHtml),
        title: contentMap[RecommendationsColumnEnum.title.name],
        isMain: isMain);
  }
}
