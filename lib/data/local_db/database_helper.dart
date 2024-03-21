part of '../../main/config.dart';

class DatabaseHelper {
  static final DatabaseHelper _obj = Config().databaseHelper;
  DatabaseHelper._(this.data);
  factory DatabaseHelper() => _obj;
  static Future<void> createAnnalsTables(Database database) async {
    try {
      await database.execute("""CREATE TABLE IF NOT EXISTS mst_article_lists(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,      
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
      await database.execute("""CREATE TABLE IF NOT EXISTS mst_article_channels(
        id INTEGER PRIMARY KEY,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        language TEXT,
        description TEXT,
        voliss TEXT,
        lastBuildDate TEXT,
        generator TEXT,
        managingEditor TEXT,
        webMaster TEXT,  
        coverImageLink TEXT,
        podCaseLink1 TEXT,
        podCaseLink2 TEXT 
        )
      """);

      await database.execute("""CREATE TABLE IF NOT EXISTS mst_current_issues(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
      """);

      await database.execute("""CREATE TABLE IF NOT EXISTS trn_bookmarks(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        author TEXT,
        description TEXT,
        type TEXT,
        pubDate TEXT,
        link TEXT,
        isFree INTEGER,
        CreatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

      await database.execute("""CREATE TABLE IF NOT EXISTS mst_ACP_journal_club(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT, 
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

      await database
          .execute("""CREATE TABLE IF NOT EXISTS mst_beyond_the_guildelines(
       id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
      await database
          .execute("""CREATE TABLE IF NOT EXISTS mst_clinical_guidelines(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

      await database.execute("""CREATE TABLE IF NOT EXISTS mst_covid19(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

      await database.execute("""CREATE TABLE IF NOT EXISTS mst_in_the_clinic(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
      """);

      await database
          .execute("""CREATE TABLE IF NOT EXISTS mst_on_being_a_doctor(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
      """);

      await database
          .execute("""CREATE TABLE IF NOT EXISTS mst_original_research(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

      await database.execute("""CREATE TABLE IF NOT EXISTS mst_reviews(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        pubDate TEXT,
        author TEXT,
        description TEXT,
        voliss TEXT,
        type TEXT,
        isFree INTEGER,
        cmeMoc TEXT,
        video TEXT,  
        audio TEXT,
        image TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
      """);

      await database.execute("""CREATE TABLE IF NOT EXISTS mst_fontsize(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
  		size REAL,
  		isActive INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Small',0.8, 0);""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Medium',1, 1);""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Large',1.2, 0);""");
      await database.execute(
          """CREATE TABLE IF NOT EXISTS ${TableNames.html}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, html TEXT, articleId TEXT)""");
      await database.execute(
          """CREATE TABLE IF NOT EXISTS trn_error_log(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, functionName TEXT, error TEXT,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
    } catch (e) {
      pushErrorLog('createAnnalsTables', jsonEncode(e));
    }
  }

  static Future<void> createAimccTables(Database database) async {
    try {
      await database.execute("""CREATE TABLE IF NOT EXISTS mst_article_lists(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        link TEXT,
        encoded TEXT,
        author TEXT,
        type TEXT,
        description TEXT,
        dcTitle TEXT,
        dcIdentifier TEXT,
        dcSource TEXT,
        pubDate TEXT,
        ccLicense TEXT,
        prismPublicationName TEXT,  
        prismVolume INTEGER,      
        prismNumber INTEGER,
        prismCoverDate  TEXT,      
        prismCoverDisplayDate TEXT,
        prismDoi  TEXT,      
        prismURL TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

      await database.execute("""CREATE TABLE IF NOT EXISTS trn_bookmarks(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        author TEXT,
        description TEXT,
        type TEXT,
        pubDate TEXT,
        link TEXT,
        CreatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

      await database.execute(
          """CREATE TABLE IF NOT EXISTS ${TableNames.html}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, html TEXT, articleId TEXT)""");
      await database.execute("""CREATE TABLE IF NOT EXISTS mst_fontsize(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
  		size REAL,
  		isActive INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Small',0.8, 0);""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Medium',1, 1);""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Large',1.2, 0);""");

      await database.execute("""CREATE TABLE IF NOT EXISTS mst_article_image(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        imageURL TEXT,
        resultedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
      """);
      await database.execute(
          """CREATE TABLE IF NOT EXISTS trn_error_log(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, functionName TEXT, error TEXT,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
    } catch (e) {
      pushErrorLog('createAimccTables', jsonEncode(e));
    }
  }

  static Future<void> createGuidelinesTable(Database database) async {
    try {
      await database.execute(
          """CREATE TABLE IF NOT EXISTS ${TableNames.guidelinesIssueTable} (
                id INTEGER PRIMARY KEY,               
                ${GuidelinesColumnEnum.guidelineId.name} TEXT, 
                ${GuidelinesColumnEnum.bundle.name} TEXT, 
                ${GuidelinesColumnEnum.fullTitle.name} TEXT, 
                ${GuidelinesColumnEnum.title.name} TEXT, 
                ${GuidelinesColumnEnum.groupName.name} TEXT, 
                ${GuidelinesColumnEnum.isExpired.name} TEXT,
                ${GuidelinesColumnEnum.lastPublishedDate.name} TEXT, 
                ${GuidelinesColumnEnum.pdfUrl.name} TEXT, 
                ${GuidelinesColumnEnum.url.name} TEXT, 
                ${GuidelinesColumnEnum.newArticle.name} TEXT)""");

      await database.execute(
          """CREATE TABLE IF NOT EXISTS ${TableNames.acpGuideLinesforIpad} (
                id INTEGER PRIMARY KEY,
                ${ACPGuideLinesEnum.name.name} TEXT,
                ${ACPGuideLinesEnum.published.name} TEXT,
                ${ACPGuideLinesEnum.version.name} TEXT)""");

      await database.execute(
          """CREATE TABLE IF NOT EXISTS ${TableNames.guidelinesRecommendationsTable} (
        id INTEGER PRIMARY KEY,
        ${RecommendationsColumnEnum.guidelineId.name} TEXT,
        ${RecommendationsColumnEnum.recommendationIndex.name} INTEGER,
        ${RecommendationsColumnEnum.file.name} TEXT,
        ${RecommendationsColumnEnum.isMain.name} TEXT,
        ${RecommendationsColumnEnum.title.name} TEXT) """);

      await database.execute("""CREATE TABLE IF NOT EXISTS mst_fontsize(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
  		  size REAL,
  		  isActive INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Small',0.8, 0);""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Medium',1, 1);""");
      await database.execute(
          """INSERT INTO mst_fontsize (title, size, isActive) VALUES ('Large',1.2, 0);""");
      await database.execute(
          """CREATE TABLE IF NOT EXISTS trn_error_log(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, functionName TEXT, error TEXT,
          createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
      await database.execute(
          """CREATE TABLE IF NOT EXISTS ${TableNames.html}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, html TEXT, articleId TEXT)""");
    } catch (e) {
      pushErrorLog('createguidelinesTable', jsonEncode(e));
    }
  }

  final Database data;
}
