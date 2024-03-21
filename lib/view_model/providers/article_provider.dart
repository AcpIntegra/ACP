import 'dart:async';

import 'package:acp_app/data/models/annals_and_aimcc/login_response_model.dart';
import 'package:acp_app/data/network/service/error_logs.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:acp_app/view_model/providers/auth_provider/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AllArticleNotifer
    extends AutoDisposeAsyncNotifier<List<Map<String, dynamic>>> {
  get allArticleNotifier => null;
  late SharedPreferences prefs;
  @override
  Future<List<Map<String, dynamic>>> build() async {
    return await getAllArticles();
  }

  Future<List<Map<String, dynamic>>> getAllArticles() async {
    try {
      await validateTokenExpire();
      final DataRepository repository = DataRepository();
      return (await repository
          .getArticleswithBookmark(TableNames.articleList))!;
    } catch (e) {
      pushErrorLog('getAllArticles - articles', jsonEncode(e));
      return [];
    }
  }

  Future<void> updateArticles() async {
    try {
      await validateTokenExpire();
      final DataRepository repository = DataRepository();
      state = await AsyncValue.guard(() async {
        return (await repository
            .getArticleswithBookmark(TableNames.articleList))!;
      });
    } catch (e) {
      pushErrorLog('updateArticles', jsonEncode(e));
    }
  }

  Future<void> updateBookMark(index) async {
    try {
      final DataRepository repository = DataRepository();
      String bookmarksTableName = TableNames.bookmarks;
      final articleslistsbookmark = (await repository
          .getElementByarticleTitleAndType(index, bookmarksTableName));
      if (articleslistsbookmark.isNotEmpty &&
          (articleslistsbookmark[0]['title'] == index['title']) &&
          (articleslistsbookmark[0]['type'] == index['type'])) {
        await repository.deleteBookmarkByTitle(
            index['title'], index['type'], index['author'], bookmarksTableName);
      } else {
        await repository.insertBookmark(index, bookmarksTableName);
      }
      state = await AsyncValue.guard(() async {
        return await getAllArticles();
      });
    } catch (e) {
      pushErrorLog('updateBookMark - articles', jsonEncode(e));
    }
  }

  Future<void> getArticles() async {
    try {
      final DataRepository repository = DataRepository();
      state = await AsyncValue.guard(() async {
        return (await repository
            .getArticleswithBookmark(TableNames.articleList))!;
      });
    } catch (e) {
      pushErrorLog('getArticles', jsonEncode(e));
    }
  }

  validateTokenExpire() async {
    try {
      prefs = await SharedPreferences.getInstance();
      if (prefs.getString("userToken") == null) {
        ref.watch(loginProvider.notifier).getUserToken(LoginResponse.empty());
      }
      String? userTokenString = prefs.getString('userToken');
      if (userTokenString != null) {
        final Map<String, dynamic> decodedToken = jsonDecode(userTokenString);
        LoginResponse userTokenData = LoginResponse.fromJson(decodedToken);
        DateTime now = DateTime.now();
        DateTime expireDate = DateTime.parse(userTokenData.expires);
        if (now.isAfter(expireDate)) {
          prefs.remove('userToken');
          ref.watch(loginProvider.notifier).getUserToken(LoginResponse.empty());
        } else {
          ref.watch(loginProvider.notifier).getUserToken(userTokenData);
        }
      }
    } catch (e) {
      pushErrorLog('validateTokenExpire', jsonEncode(e));
    }
  }
}

final allArticlesProvider = AutoDisposeAsyncNotifierProvider<AllArticleNotifer,
    List<Map<String, dynamic>>>(() => AllArticleNotifer());
