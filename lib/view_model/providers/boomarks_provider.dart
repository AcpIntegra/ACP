import 'dart:async';
import 'dart:convert';

import 'package:acp_app/data/network/service/error_logs.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarksNotifier
    extends AutoDisposeAsyncNotifier<List<Map<String, dynamic>>> {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    return await getAllBookmarkedArticles();
  }

  Future<List<Map<String, dynamic>>> getAllBookmarkedArticles() async {
    try {
      final DataRepository repository = DataRepository();
      return (await repository.getBookmarks(TableNames.bookmarks))!;
    } catch (e) {
      pushErrorLog('getAllBookmarkedArticles', jsonEncode(e));
      return [];
    }
  }

  Future<void> updateBookmarkedArticles() async {
    try {
      final DataRepository repository = DataRepository();
      state = await AsyncValue.guard(() async {
        return (await repository.getBookmarks(TableNames.bookmarks))!;
      });
    } catch (e) {
      pushErrorLog('updateBookmarkedArticles', jsonEncode(e));
    }
  }

  Future<void> updateBookMarks(index) async {
    try {
      final DataRepository repository = DataRepository();
      String bookmarksTableName = TableNames.bookmarks;
      state = await AsyncValue.guard(() async {
        await repository.deleteBookmarkByTitle(
            index['title'], index['type'], index['author'], bookmarksTableName);
        return await getAllBookmarkedArticles();
      });
    } catch (e) {
      pushErrorLog('updateBookMarks', jsonEncode(e));
    }
  }
}

final bookmarkProvider = AutoDisposeAsyncNotifierProvider<BookmarksNotifier,
    List<Map<String, dynamic>>>(() => BookmarksNotifier());
