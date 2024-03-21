import 'package:acp_app/data/models/annals_and_aimcc/user.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:xml/xml.dart';
import 'package:dio/dio.dart';
import 'package:acp_app/data/network/service/get_collections.dart';
import 'package:intl/intl.dart';

Future<void> fetchArticles() async {
  // Sample data for articlelist
  final articleRepository = DataRepository();

  // Call the function from main.dart to get the users list
  List<Collection> collections = getCollectionsList();

  var dio = Dio();
  // Print the results
  await Future.wait(collections.map((collection) async {
    var response = await dio.get(
      collection.collectionURL, // Replace with your path
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
        final String title =
            element.findElements('title').firstOrNull?.innerText ?? '';

        final String? link =
            element.findElements('link').firstOrNull?.innerText;
        final String? description =
            element.findElements('description').firstOrNull?.innerText;
        final String? voliss =
            element.findElements('volIss').firstOrNull?.innerText;
        final String? pubdate =
            element.findElements('pubDate').firstOrNull?.innerText;
        final String author =
            element.findElements('author').firstOrNull?.innerText ?? '';
        final String type =
            element.findElements('type').firstOrNull?.innerText ?? '';
        final String? isarticlefree =
            element.findElements('free').firstOrNull?.innerText;
        final String? cmemoc =
            element.findElements('cme_moc').firstOrNull?.innerText;
        final String? audio =
            element.findElements('audio').firstOrNull?.innerText;
        final String? video =
            element.findElements('video').firstOrNull?.innerText;
        // final String? createdat =
        //     element.findElements('createdAt').firstOrNull?.innerText;
        // Parse the input date

        DateTime parsedDate = collection.collectionName == 'mst_current_issues'
            ? DateFormat('MMMM yyyy').parse(pubdate ?? '')
            : DateFormat('dd MMMM yyyy').parse(pubdate ?? '');

        // Format the date as 'YYYY-MM-DD'
        String formattedDate = collection.collectionName == 'mst_current_issues'
            ? DateFormat('yyyy-MM').format(parsedDate)
            : DateFormat('yyyy-MM-dd').format(parsedDate);

        final article = DataModel(data: {
          'title': title,
          'link': link,
          'description': description,
          'pubDate': formattedDate,
          'author': author,
          'type': type,
          'isFree': isarticlefree?.toLowerCase() == 'no' ? 0 : 1,
          'cmeMoc': cmemoc,
          'audio': audio,
          'video': video,
          'voliss': voliss,
          'createdAt': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())
        });
        final isTitleExist =
            await articleRepository.getElementByTitleWithAuthor(
                title, type, author, collection.collectionName);
        if (isTitleExist == null) {
          await articleRepository.insert(article, collection.collectionName);
        } else {
          article.data['createdAt'] =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          final existData =
              DataModel(id: isTitleExist['id'], data: article.data);
          await articleRepository.update(existData, collection.collectionName);
        }
      }));
      var channels = xmlDocument.findAllElements('channel');
      await Future.wait(channels.map((channel) async {
        final channelData = DataModel(data: {
          'id': collection.collectionId,
          'title': channel.findElements('title').firstOrNull?.innerText,
          'link': channel.findElements('link').firstOrNull?.innerText,
          'pubDate': channel.findElements('pubDate').firstOrNull?.innerText,
          'language': channel.findElements('language').firstOrNull?.innerText,
          'description':
              channel.findElements('description').firstOrNull?.innerText,
          'lastBuildDate':
              channel.findElements('lastBuildDate').firstOrNull?.innerText,
          'generator': channel.findElements('generator').firstOrNull?.innerText,
          'managingEditor':
              channel.findElements('managingEditor').firstOrNull?.innerText,
          'webMaster': channel.findElements('webMaster').firstOrNull?.innerText,
          'coverImageLink':
              channel.findElements('coverImageLink').firstOrNull?.innerText,
          'podCaseLink1':
              channel.findElements('podcastLink1').firstOrNull?.innerText,
          'podCaseLink2':
              channel.findElements('podcastLink2').firstOrNull?.innerText
        });
        final isChannalExist = await articleRepository.getElementById(
            collection.collectionId, TableNames.channels);
        if (isChannalExist != null) {
          final updateData =
              DataModel(id: isChannalExist['id'], data: channelData.data);
          await articleRepository.update(updateData, TableNames.channels);
        } else {
          await articleRepository.insert(channelData, TableNames.channels);
        }
      }));
    }
  }));
}
