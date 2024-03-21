import 'dart:convert';

import 'package:acp_app/data/network/service/error_logs.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:just_audio/just_audio.dart';

class AllCurrentIssueArticleNotifer
    extends AutoDisposeAsyncNotifier<List<Map<String, dynamic>>> {
  List<Map<String, dynamic>> channelArticles = [];
  // late final AudioPlayer player = AudioPlayer();
  // late final AudioPlayer player2 = AudioPlayer();
  bool isPresentFirstAudio = false;
  String podCastAudio1 = '';
  String podCastAudio2 = '';
  bool isPresentSecondAudio = false;

  @override
  Future<List<Map<String, dynamic>>> build() async {
    final DataRepository repository = DataRepository();
    channelArticles = (await repository.getChannel(2))!;
    // channelArticles[0]['podCaseLink2'] =
    //     'https://www.acpjournals.org/pb-assets/audio/annals_20240220.mp3';
    if (channelArticles[0]['podCaseLink2'] != null) {
      // setSecondAudioUrl(channelArticles[0]['podCaseLink2']);
      podCastAudio2 = channelArticles[0]['podCaseLink2'];

      isPresentSecondAudio = true;
    } else {
      isPresentSecondAudio = false;
    }
    if (channelArticles[0]['podCaseLink1'] != null) {
      podCastAudio1 = channelArticles[0]['podCaseLink1'];
      // setAudioUrl(channelArticles[0]['podCaseLink1']);

      isPresentFirstAudio = true;
    } else {
      isPresentFirstAudio = false;
    }

    return await getCurrentIssueArticle();
  }

  // setAudioUrl(String url) async {
  //   await player.setUrl(url);
  // }

  // setSecondAudioUrl(String url) async {
  //   await player2.setUrl(url);
  // }

  // dispose() async {
  //   player.stop();
  //   player2.stop();
  // }

  // audioPause() async {
  //   if (player2.playing) {
  //     player2.pause();
  //   } else {
  //     player.pause();
  //   }
  // }

  Future<List<Map<String, dynamic>>> getCurrentIssueArticle() async {
    try {
      final DataRepository repository = DataRepository();
      final currentIsue =
          (await repository.getArticleswithBookmark(TableNames.currentIssues))!;
      return currentIsue;
    } catch (e) {
      pushErrorLog('getCurrentIssueArticle', jsonEncode(e));
      return [];
    }
  }

  Future<void> getUpdatedIssues() async {
    try {
      final DataRepository repository = DataRepository();
      state = await AsyncValue.guard(() async {
        return (await repository
            .getArticleswithBookmark(TableNames.currentIssues))!;
      });
    } catch (e) {
      pushErrorLog('getUpdatedIssues', jsonEncode(e));
    }
  }

  getChannel(int id) async {
    try {
      final data = DataRepository();
      var channalArticles = (await data.getChannel(id))!;
      return channalArticles;
    } catch (e) {
      pushErrorLog('getChannel', jsonEncode(e));
      return [];
    }
  }

  Future<void> updateBookMark(index) async {
    try {
      final DataRepository repository = DataRepository();
      String bookmarksTableName = TableNames.bookmarks;

      state = await AsyncValue.guard(() async {
        final articleslistsbookmark = (await repository
            .getElementByarticleTitleAndType(index, bookmarksTableName));
        if (articleslistsbookmark.isNotEmpty &&
            (articleslistsbookmark[0]['title'] == index['title']) &&
            (articleslistsbookmark[0]['type'] == index['type'])) {
          await repository.deleteBookmarkByTitle(index['title'], index['type'],
              index['author'], bookmarksTableName);
        } else {
          await repository.insertBookmark(index, bookmarksTableName);
        }
        return await getCurrentIssueArticle();
      });
    } catch (e) {
      pushErrorLog('updateBookMark - current issues', jsonEncode(e));
    }
  }
}

final currentIssueArticlesProvider = AutoDisposeAsyncNotifierProvider<
    AllCurrentIssueArticleNotifer,
    List<Map<String, dynamic>>>(() => AllCurrentIssueArticleNotifer());
