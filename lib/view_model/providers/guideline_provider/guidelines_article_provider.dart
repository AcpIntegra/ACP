import 'dart:async';

import 'package:acp_app/data/models/guidelines/guidelines_issue.dart';
import 'package:acp_app/data/network/api/guidelines_api.dart';
import 'package:acp_app/data/network/service/connectivity.dart';
import 'package:acp_app/main/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidelinesIssueNotifier extends AutoDisposeAsyncNotifier<ACPGuideLines> {
  @override
  Future<ACPGuideLines> build() async => await _changeArticle(false);

  Future<void> fetch(bool value) async {
    bool isConnected = await ConnectivityStatus().checkConnection();
    if (isConnected) {
      state = await AsyncValue.guard(() async {
        final acpGuideLines = await GuidelinesApi().fetchGuidelinesArticle();
        return ACPGuideLines(
            name: acpGuideLines.name,
            issuesList: List<GuideLinesIssue>.from(acpGuideLines.issuesList
                .where((element) => element.isExpired == value)),
            version: acpGuideLines.version,
            published: acpGuideLines.published);
      });
    }
  }

  Future<ACPGuideLines> _changeArticle(bool value) async {
    final acpGuideLines = await DataRepository().getGuidelinesIssue();
    return ACPGuideLines(
        name: acpGuideLines.name,
        issuesList: List<GuideLinesIssue>.from(acpGuideLines.issuesList
            .where((element) => element.isExpired == value)),
        version: acpGuideLines.version,
        published: acpGuideLines.published);
  }

  Future<void> changeArticle(bool value) async {
    final newGuideline = await _changeArticle(value);
    state = AsyncValue.data(newGuideline);
  }
}

final guidelinesIssueProvider =
    AutoDisposeAsyncNotifierProvider<GuidelinesIssueNotifier, ACPGuideLines>(
        () => GuidelinesIssueNotifier());

class GuidelineSelectedIndex extends AutoDisposeNotifier<bool> {
  @override
  bool build() => false;

  void change(bool change) => state = change;
}

final guidelineSelectedIndexProvider =
    AutoDisposeNotifierProvider<GuidelineSelectedIndex, bool>(
        () => GuidelineSelectedIndex());
