import 'dart:convert';

import 'package:acp_app/data/models/font_model.dart';
import 'package:acp_app/data/network/service/error_logs.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FontNotifier extends Notifier<FontResponse> {
  final DataRepository fontRepository = DataRepository();

  @override
  FontResponse build() => FontResponse.empty();

  Future<FontResponse> getActiveFonts() async {
    String tbName = TableNames.fontsize;
    try {
      final fontData = await fontRepository.getActiveFont(tbName);
      if (fontData.isNotEmpty) {
        return FontResponse.fromJson(fontData.first);
      } else {
        // Handle the case when fontData is empty
        throw Exception("Font data is empty for table $tbName");
      }
    } catch (e) {
      pushErrorLog('getActiveFonts', jsonEncode(e));
      return FontResponse.empty();
    }
  }

  Future<void> updateFonts(String item, String tableName) async {
    try {
      final DataRepository fontRepository = DataRepository();
      bool isUpdated =
          await fontRepository.updateFont(item, TableNames.fontsize);
      if (isUpdated) {
        state = await getActiveFonts();
      }
    } catch (e) {
      pushErrorLog('updateFonts', jsonEncode(e));
    }
  }

  Future<void> loadDefaultFonts() async {
    try {
      state = await getActiveFonts();
    } catch (e) {
      pushErrorLog('loadDefaultFonts', jsonEncode(e));
    }
  }
}

final NotifierProvider<FontNotifier, FontResponse> fontProvider =
    NotifierProvider<FontNotifier, FontResponse>(() => FontNotifier());
