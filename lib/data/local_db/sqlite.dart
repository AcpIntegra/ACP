part of '../../main/config.dart';

class DataRepository {
  final Database database;
  static final DataRepository _obj = Config().dataRepository;
  DataRepository._({required this.database});
  factory DataRepository() => _obj;

  Future<int> insert(dynamic item, String tableName) async {
    try {
      return await database.insert(tableName, item.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      pushErrorLog('insert', jsonEncode(e));
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getAll(String tableName) async {
    return await database.query(tableName);
  }

  Future<int> deleteWhere(
          String table, String where, List<dynamic> whereArgs) async =>
      await database.delete(table, where: where, whereArgs: whereArgs);

  Future<int> update(DataModel item, String tableName) async => await database
      .update(tableName, item.toMap(), where: 'id = ?', whereArgs: [item.id]);

  Future<bool> updateFont(String item, String tableName) async {
    try {
      await database.rawQuery(
          '''UPDATE $tableName SET isActive = CASE WHEN title = ? THEN 1 ELSE 0 END''',
          [item]);
      return true;
    } catch (e) {
      pushErrorLog('updateFont', jsonEncode(e));
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getActiveFont(String tableName) async {
    try {
      return await database
          .query(tableName, where: 'isActive = ?', whereArgs: [1]);
    } catch (e) {
      pushErrorLog('getActiveFont', jsonEncode(e));
      return [];
    }
  }

  Future<int> delete(int id, String tableName) async {
    return await database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteuserId(String id, String tableName) async {
    try {
      return await database
          .delete(tableName, where: 'userId = ?', whereArgs: [id]);
    } catch (e) {
      pushErrorLog('deleteuserId', jsonEncode(e));
      return -1;
    }
  }

  Future<int> deleteBookmarkByTitle(
      String title, String type, String author, String tableName) async {
    try {
      return await database.delete(tableName,
          where: 'title = ? AND type = ? AND author = ?',
          whereArgs: [title, type, author]);
    } catch (e) {
      pushErrorLog('deleteBookmarkByTitle', jsonEncode(e));
      return -1;
    }
  }

  // Get element by ID
  Future<Map<String, dynamic>?> getElementById(int id, String tableName) async {
    try {
      List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      pushErrorLog('getElementById', jsonEncode(e));
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getAllWhere(
      String tableName, String where, List<dynamic> whereArgs) async {
    try {
      return await database.query(tableName,
          where: where, whereArgs: whereArgs);
    } catch (e) {
      pushErrorLog('getAllWhere', jsonEncode(e));
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getElementByarticleTitleAndType(
      article, String tableName) async {
    try {
      List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'title = ? AND type = ? AND author= ?',
        whereArgs: [article['title'], article['type'], article['author']],
      );
      return List<Map<String, dynamic>>.generate(
          result.length, (index) => Map<String, dynamic>.from(result[index]),
          growable: true);
    } catch (e) {
      pushErrorLog('getElementByarticleTitleAndType', jsonEncode(e));
      return [];
    }
  }

  // Other CRUD operations can be added here
  Future<Map<String, dynamic>?> getElementByTitle(
      String title, String type, String author, String tableName) async {
    try {
      List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'title = ? AND type = ? AND author= ?',
        whereArgs: [title, type, author],
      );
      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      pushErrorLog('getElementByTitle', jsonEncode(e));
      return null;
    }
  }

  Future<Map<String, dynamic>?> getElementByTitleWithAuthor(
      String title, String type, String author, String tableName) async {
    try {
      List<Map<String, dynamic>> result = await database.query(
        tableName,
        where: 'title = ? AND type = ? AND author = ?',
        whereArgs: [title, type, author],
      );
      return result.isNotEmpty ? result.first : null;
    } catch (e) {
      pushErrorLog('getElementByTitleWithAuthor', jsonEncode(e));
      return null;
    }
  }

  Future<void> insertBookmark(articleItem, bookmarksTableName) async {
    try {
      await database.insert(
        bookmarksTableName,
        F.appFlavor == Flavor.annals
            ? {
                'title': articleItem['title'],
                'type': articleItem['type'],
                'description': articleItem['description'],
                'author': articleItem['author'],
                'pubDate': articleItem['pubDate'],
                'link': articleItem['link'],
                'isFree': articleItem['isFree']
              }
            : {
                'title': articleItem['title'],
                'type': articleItem['type'],
                'description': articleItem['description'],
                'author': articleItem['author'],
                'link': articleItem['link'],
                'pubDate': articleItem['pubDate']
              },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      pushErrorLog('insertBookmark', jsonEncode(e));
    }
  }

  Future<List<Map<String, dynamic>>?> getArticleswithBookmark(
      String tableName) async {
    try {
      final List<Map<String, dynamic>> result =
          await database.rawQuery(getQuery(tableName));
      return List<Map<String, dynamic>>.generate(
          result.length, (index) => Map<String, dynamic>.from(result[index]),
          growable: true);
    } catch (e) {
      pushErrorLog('getArticleswithBookmark', jsonEncode(e));
      return [];
    }
  }

  Future<List<Map<String, dynamic>>?> getChannel(int id) async {
    try {
      final List<Map<String, dynamic>> result = await database
          .rawQuery('''SELECT * FROM mst_article_channels where id = $id''');
      return List<Map<String, dynamic>>.generate(
          result.length, (index) => Map<String, dynamic>.from(result[index]),
          growable: true);
    } catch (e) {
      pushErrorLog('getChannel', jsonEncode(e));
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getQuaryBasedInfo(String url) async {
    try {
      final List<Map<String, dynamic>> result = await database.rawQuery(url);
      return List<Map<String, dynamic>>.generate(
          result.length, (index) => Map<String, dynamic>.from(result[index]),
          growable: true);
    } catch (e) {
      pushErrorLog('getQuaryBasedInfo', jsonEncode(e));
      return [];
    }
  }

  Future<List<Map<String, dynamic>>?> getBookmarks(String tableName) async {
    try {
      final List<Map<String, dynamic>> result =
          await database.rawQuery('''SELECT *
FROM $tableName ORDER BY CreatedDate DESC''');
      return List<Map<String, dynamic>>.generate(
          result.length, (index) => Map<String, dynamic>.from(result[index]),
          growable: true);
    } catch (e) {
      pushErrorLog('getBookmarks', jsonEncode(e));
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getSearchData(
      String userId, String tableName) async {
    try {
      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        where:
            'userId = ?', // Adjust the condition based on your actual column name
        whereArgs: [userId],
      );
      return List<Map<String, dynamic>>.generate(
          result.length, (index) => Map<String, dynamic>.from(result[index]),
          growable: true);
    } catch (e) {
      pushErrorLog('getSearchData', jsonEncode(e));
      return null;
    }
  }

  Future<String?> getHtml(Map<String, dynamic> articleItem) async {
    try {
      var id = articleItem['id'];
      var items = await getQuaryBasedInfo(
          '''SELECT html FROM trn_html WHERE articleId='$id' ''');
      return items.first['html'];
    } catch (e) {
      pushErrorLog('getHtml', e.toString());
      return null;
    }
  }

  Future<void> insertHtml(Map<String, dynamic> articleItem, String html) async {
    try {
      await database.insert(
          TableNames.html, {'articleId': articleItem['id'], 'html': html},
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      pushErrorLog('insertHtml', e.toString());
    }
  }

  String getQuery(String tableName) {
    try {
      if (F.appFlavor == Flavor.annals) {
        if (tableName == TableNames.currentIssues) {
          return '''SELECT 
    articles.id,   
    articles.title,
    articles.link,
    articles.description,
    articles.author,
    articles.type,
    articles.isFree,
    articles.cmeMoc,
    articles.video,
    articles.voliss,
    articles.audio,
    articles.image,
    articles.createdAt,
    CASE substr(articles.pubDate, 6, 2)
        WHEN '01' THEN 'Jan'
        WHEN '02' THEN 'Feb'
        WHEN '03' THEN 'Mar'
        WHEN '04' THEN 'Apr'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'Jun'
        WHEN '07' THEN 'Jul'
        WHEN '08' THEN 'Aug'
        WHEN '09' THEN 'Sep'
        WHEN '10' THEN 'Oct'
        WHEN '11' THEN 'Nov'
        WHEN '12' THEN 'Dec'
        ELSE 'Invalid Month'
    END ||
    ' ' || substr(articles.pubDate, 1, 4) AS pubDate,
    CASE WHEN (bookmarks.title AND bookmarks.type AND bookmarks.author) IS NULL THEN 0 ELSE 1 END AS is_bookmarked 
FROM $tableName as articles 
LEFT JOIN trn_bookmarks as bookmarks ON articles.title = bookmarks.title AND articles.type = bookmarks.type AND articles.author = bookmarks.author
ORDER BY articles.pubDate DESC
''';
        } else {
          return '''SELECT 
    articles.id,   
    articles.title,
    articles.link,
    articles.description,
    articles.author,
    articles.type,
    articles.isFree,
    articles.cmeMoc,
    articles.video,
    articles.voliss,
    articles.audio,
    articles.image,
    articles.createdAt,
    substr(articles.pubDate, 9, 2) || ' ' ||
    CASE substr(articles.pubDate, 6, 2)
        WHEN '01' THEN 'Jan'
        WHEN '02' THEN 'Feb'
        WHEN '03' THEN 'Mar'
        WHEN '04' THEN 'Apr'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'Jun'
        WHEN '07' THEN 'Jul'
        WHEN '08' THEN 'Aug'
        WHEN '09' THEN 'Sep'
        WHEN '10' THEN 'Oct'
        WHEN '11' THEN 'Nov'
        WHEN '12' THEN 'Dec'
        ELSE 'Invalid Month'
    END ||
    ' ' || substr(articles.pubDate, 1, 4) AS pubDate,
    CASE WHEN (bookmarks.title AND bookmarks.type AND bookmarks.author) IS NULL THEN 0 ELSE 1 END AS is_bookmarked 
FROM $tableName as articles 
LEFT JOIN trn_bookmarks as bookmarks ON articles.title = bookmarks.title AND articles.type = bookmarks.type AND articles.author = bookmarks.author
ORDER BY articles.pubDate DESC
''';
        }
      } else {
        return '''SELECT 
    articles.id,   
    articles.title,
    articles.link,
    articles.description,
    articles.author,
    articles.type,
    articles.dcTitle,
    articles.dcIdentifier,
    articles.dcSource,
    articles.ccLicense,
    articles.prismPublicationName,
    articles.prismVolume,
    articles.prismNumber,
    articles.prismCoverDate,
    articles.prismCoverDisplayDate,
    articles.prismDoi,
    articles.prismURL,
    substr(articles.pubDate, 9, 2) || ' ' ||
    CASE substr(articles.pubDate, 6, 2)
        WHEN '01' THEN 'Jan'
        WHEN '02' THEN 'Feb'
        WHEN '03' THEN 'Mar'
        WHEN '04' THEN 'Apr'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'Jun'
        WHEN '07' THEN 'Jul'
        WHEN '08' THEN 'Aug'
        WHEN '09' THEN 'Sep'
        WHEN '10' THEN 'Oct'
        WHEN '11' THEN 'Nov'
        WHEN '12' THEN 'Dec'
        ELSE 'Invalid Month'
    END ||
    ' ' || substr(articles.pubDate, 1, 4) AS pubDate,
    CASE WHEN (bookmarks.title AND bookmarks.type AND bookmarks.author) IS NULL THEN 0 ELSE 1 END AS is_bookmarked 
FROM mst_article_lists as articles 
LEFT JOIN trn_bookmarks as bookmarks ON articles.title = bookmarks.title AND articles.type = bookmarks.type AND articles.author = bookmarks.author
ORDER BY articles.pubDate DESC
''';
      }
    } catch (e) {
      pushErrorLog('getQuery', jsonEncode(e));
      return '';
    }
  }

  Future<void> insertInGuidelinesTable(ACPGuideLines acpGuideLines) async {
    List<GuideLinesIssue> issues = acpGuideLines.issuesList;
    await database.delete(TableNames.acpGuideLinesforIpad);
    await database.delete(TableNames.guidelinesIssueTable);
    await database.delete(TableNames.guidelinesRecommendationsTable);
    await database.insert(
        TableNames.acpGuideLinesforIpad,
        {
          ACPGuideLinesEnum.name.name: acpGuideLines.name,
          ACPGuideLinesEnum.published.name:
              acpGuideLines.published.toIso8601String(),
          ACPGuideLinesEnum.version.name: acpGuideLines.version
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    await Future.wait(issues.map((guidelines) async {
      await database.insert(
          TableNames.guidelinesIssueTable,
          {
            GuidelinesColumnEnum.guidelineId.name: guidelines.guidelineId,
            GuidelinesColumnEnum.groupName.name: guidelines.group,
            GuidelinesColumnEnum.lastPublishedDate.name:
                guidelines.lastPublishedDate.toIso8601String(),
            GuidelinesColumnEnum.isExpired.name:
                guidelines.isExpired.toString(),
            GuidelinesColumnEnum.bundle.name: guidelines.bundle,
            GuidelinesColumnEnum.pdfUrl.name: guidelines.pdfUrl,
            GuidelinesColumnEnum.url.name: guidelines.url,
            GuidelinesColumnEnum.title.name: guidelines.title,
            GuidelinesColumnEnum.fullTitle.name: guidelines.fullTitle,
            GuidelinesColumnEnum.newArticle.name:
                guidelines.newArticle.toString()
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }));
  }

  Future<ACPGuideLines> getGuidelinesIssue() async {
    List<Map<String, dynamic>> list = await getQuaryBasedInfo(
        'SELECT * FROM ${TableNames.guidelinesIssueTable}');
    List<Map<String, dynamic>> acpGuideLinesforIpad = await getQuaryBasedInfo(
        'SELECT * FROM ${TableNames.acpGuideLinesforIpad}');
    List<GuideLinesIssue> guideLinesIssue = [];
    ACPGuideLines guideLines = ACPGuideLines.empty();
    for (var json in list) {
      guideLinesIssue.add(GuideLinesIssue.fromJson(json));
    }
    await Future.wait(guideLinesIssue.map((issue) async =>
        issue.recommendationList = await getRecommendations(issue)));
    for (var map in acpGuideLinesforIpad) {
      guideLines = ACPGuideLines(
          name: map[ACPGuideLinesEnum.name.name],
          issuesList: guideLinesIssue,
          version: double.parse(map[ACPGuideLinesEnum.version.name]),
          published: DateTime.parse(map[ACPGuideLinesEnum.published.name]));
    }
    return guideLines;
  }

  Future<void> insertRecommendations(Recommendations recommendation) async {
    try {
      await database.insert(
          TableNames.guidelinesRecommendationsTable,
          {
            RecommendationsColumnEnum.recommendationIndex.name:
                recommendation.recommendationIndex,
            RecommendationsColumnEnum.guidelineId.name:
                recommendation.guidelineId,
            RecommendationsColumnEnum.title.name: recommendation.title,
            RecommendationsColumnEnum.file.name:
                recommendation.htmlDocument.outerHtml,
            RecommendationsColumnEnum.isMain.name:
                recommendation.isMain.toString()
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    } on Exception catch (e) {
      pushErrorLog("insertRecommendations", e.toString());
    }
  }

  Future<List<Recommendations>> getRecommendations(
      GuideLinesIssue issue) async {
    try {
      var data = await getQuaryBasedInfo(
          '''SELECT * FROM ${TableNames.guidelinesRecommendationsTable} WHERE ${RecommendationsColumnEnum.guidelineId.name}="${issue.guidelineId}"''');
      List<Recommendations> recommendationList = [];
      for (var json in data) {
        recommendationList.add(Recommendations.fromJson(json));
      }
      recommendationList.sort(
          (r1, r2) => r1.recommendationIndex.compareTo(r2.recommendationIndex));
      return recommendationList;
    } on Exception catch (e) {
      pushErrorLog("getRecommendations", e.toString());
      return [];
    }
  }
}
