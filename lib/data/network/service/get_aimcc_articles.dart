import 'package:acp_app/data/models/annals_and_aimcc/user.dart';
import 'package:acp_app/main/config.dart';
import 'package:xml/xml.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

Future<void> fetchArticles() async {
  // Sample data for articlelist
  final articleRepository = DataRepository();

  var dio = Dio();
  // Print the results
  var response = await dio.get(
    'https://www.acpjournals.org/action/showFeed?type=etoc&feed=rss&jc=aimcc', // Replace with your path
    options: Options(),
  );
  if (response.statusCode == 503) {
    //Write code here
  } else if (response.statusCode == 200) {
    // Parse XML response
    XmlDocument xmlDocument = XmlDocument.parse(response.data);

    // Access XML elements
    var elements = xmlDocument.findAllElements('item');

    await Future.wait(elements.map((element) async {
      final String? title =
          element.findElements('title').firstOrNull?.innerText;
      final String? link = element.findElements('link').firstOrNull?.innerText;
      final String? description =
          element.findElements('description').firstOrNull?.innerText;
      final String? encoded =
          element.findElements('content:encoded').firstOrNull?.innerText;
      final String author = getAuthor(element);
      final String type =
          element.findElements('type').firstOrNull?.innerText ?? '';
      final String? dcTitle =
          element.findElements('dc:title').firstOrNull?.innerText;
      final String? dcIdentifier =
          element.findElements('dc:identifier').firstOrNull?.innerText;
      final String? dcSource =
          element.findElements('dc:source').firstOrNull?.innerText;
      final String? dcDate =
          element.findElements('dc:date').firstOrNull?.innerText;
      final String? ccLicense =
          element.findElements('cc:license').firstOrNull?.innerText;
      final String? prismPublicationName =
          element.findElements('prism:publicationName').firstOrNull?.innerText;
      final String prismVolume =
          element.findElements('prism:volume').firstOrNull?.innerText ?? '';
      final String prismNumber =
          element.findElements('prism:number').firstOrNull?.innerText ?? '';
      final String? prismCoverDate =
          element.findElements('prism:coverDate').firstOrNull?.innerText;
      final String? prismCoverDisplayDate =
          element.findElements('prism:coverDisplayDate').firstOrNull?.innerText;
      final String? prismDoi =
          element.findElements('prism:doi').firstOrNull?.innerText;
      final String? prismURL =
          element.findElements('prism:url').firstOrNull?.innerText;
      DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
      // Parse the input date
      DateTime parsedDate = inputFormat.parse(dcDate ?? '');
      // Format the date as 'YYYY-MM-DD'
      String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

      final article = DataModel(data: {
        'title': title,
        'link': link,
        'description': description?.replaceAll(RegExp(r'<br/>'), ''),
        'encoded': encoded,
        'author': author,
        'type': type,
        'dcTitle': dcTitle,
        'dcIdentifier': dcIdentifier,
        'dcSource': dcSource,
        'pubDate': formattedDate,
        'ccLicense': ccLicense,
        'prismPublicationName': prismPublicationName,
        'prismVolume': prismVolume == '' ? 0 : int.parse(prismVolume),
        'prismNumber': prismNumber == '' ? 0 : int.parse(prismNumber),
        'prismCoverDate': prismCoverDate,
        'prismCoverDisplayDate': prismCoverDisplayDate,
        'prismDoi': prismDoi,
        'prismURL': prismURL,
        'createdAt': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())
      });
      final isTitleExist = await articleRepository.getElementByTitle(
          article.data['title'],
          article.data['type'],
          article.data['author'],
          'mst_article_lists');
      if (isTitleExist == null) {
        await articleRepository.insert(article, 'mst_article_lists');
      } else {
        article.data['createdAt'] =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        final existData = DataModel(id: isTitleExist['id'], data: article.data);
        await articleRepository.update(existData, 'mst_article_lists');
      }
    }));
    var imageData = xmlDocument.findAllElements('image');
    await Future.wait(imageData.map((img) async {
      final channelData = DataModel(data: {
        'imageURL': img.findElements('url').firstOrNull?.innerText,
      });
      await articleRepository.insert(channelData, 'mst_article_image');
    }));
  }
}

String getAuthor(XmlElement element) {
  String authorName = '';
  var creators = element.findAllElements('dc:creator');
  Future.wait(creators.map((author) async {
    final authorInnerText = author.innerText;
    authorName = "$authorName $authorInnerText,";
  }));
  return authorName.substring(0, authorName.length - 1);
}
