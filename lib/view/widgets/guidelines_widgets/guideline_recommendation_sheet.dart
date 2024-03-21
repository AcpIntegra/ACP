import 'package:acp_app/data/models/guidelines/guidelines_issue.dart';
import 'package:acp_app/utils/constants/guideline_table_columns.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidelineRecommendationsPage extends ConsumerWidget {
  const GuidelineRecommendationsPage(
      {super.key,
      required this.recommendationList,
      required this.tabController});

  final TabController tabController;

  final List<Recommendations> recommendationList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.read(darkModeProvider);
    final double activeSize = ref.read(fontProvider).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: recommendationList
            .map((recommendation) => recommendationList.first == recommendation
                ? Text("CONTENTS",
                    style: TextStyle(
                        fontSize: 14 * activeSize,
                        color: ref.watch(darkModeProvider)
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().bgColor))
                : OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      tabController.animateTo(
                          recommendation.recommendationIndex,
                          duration: animateToDuration);
                    },
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Semantics(
                            label:
                                '${recommendation.title.toUpperCase()} double tap to open',
                            excludeSemantics: true,
                            child: Text(
                              recommendation.title.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14 * activeSize,
                                  color: isDark
                                      ? CustomThemes().gettheme().whitecolor
                                      : CustomThemes().gettheme().black),
                            )))))
            .toList(),
      ),
    );
  }
}
