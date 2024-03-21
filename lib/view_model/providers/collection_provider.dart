import 'dart:async';
import 'dart:convert';

import 'package:acp_app/data/network/service/error_logs.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollectionNotifer
    extends AutoDisposeFamilyAsyncNotifier<List<Map<String, dynamic>>, String> {
  final data = DataRepository();

  @override
  Future<List<Map<String, dynamic>>> build(String arg) async {
    return await getcollectionArticles(arg);
  }

  Future<List<Map<String, dynamic>>> getcollectionArticles(
      String tableName) async {
    try {
      final DataRepository repository = DataRepository();
      final currentIsue =
          (await repository.getArticleswithBookmark(tableName))!;
      return currentIsue;
    } catch (e) {
      pushErrorLog('getcollectionArticles', jsonEncode(e));
      return [];
    }
  }

  Future<void> getUpdatedCollections(String tableName) async {
    try {
      final DataRepository repository = DataRepository();
      state = await AsyncValue.guard(() async {
        return (await repository.getArticleswithBookmark(tableName))!;
      });
    } catch (e) {
      pushErrorLog('getUpdatedCollections', jsonEncode(e));
    }
  }

  Future<void> updateBookMark(index, tablename) async {
    try {
      final DataRepository collectionRepository = DataRepository();
      String bookmarksTableName = TableNames.bookmarks;
      state = await AsyncValue.guard(() async {
        final articleslistsbookmark = (await collectionRepository
            .getElementByarticleTitleAndType(index, bookmarksTableName));
        if (articleslistsbookmark.isNotEmpty &&
            (articleslistsbookmark[0]['title'] == index['title']) &&
            (articleslistsbookmark[0]['type'] == index['type'])) {
          await collectionRepository.deleteBookmarkByTitle(index['title'],
              index['type'], index['author'], bookmarksTableName);
        } else {
          await collectionRepository.insertBookmark(index, bookmarksTableName);
        }
        return await getcollectionArticles(tablename);
      });
    } catch (e) {
      pushErrorLog('updateBookMark - collections', jsonEncode(e));
    }
  }
}

final AutoDisposeAsyncNotifierProviderFamily<CollectionNotifer,
        List<Map<String, dynamic>>, String> collectionProvider =
    AutoDisposeAsyncNotifierProviderFamily<CollectionNotifer,
        List<Map<String, dynamic>>, String>(() => CollectionNotifer());
