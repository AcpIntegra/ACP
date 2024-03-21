import 'dart:collection';
import 'dart:io';
import 'package:acp_app/data/models/guidelines/guidelines_issue.dart';
import 'package:acp_app/view/view_utils/navigation_callback.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view/widgets/guideline_group_name_text.dart';
import 'package:acp_app/view/widgets/guidelines_widgets/active_inactive_button.dart';
import 'package:acp_app/view/widgets/guidelines_widgets/guideline_list_tile.dart';
import 'package:acp_app/view/widgets/guidelines_widgets/guideline_settings.dart';
import 'package:acp_app/view/widgets/guidelines_widgets/guildeline_regular_appbar.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:acp_app/view_model/providers/guideline_provider/guidelines_article_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidelinesFullList extends ConsumerWidget {
  const GuidelinesFullList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guidelinesIssue = ref.watch(guidelinesIssueProvider);
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      appBar: GuidelineRegularAppbar(
        onPressed: () => NavigatorCallback.showDialogBox(
            context: context, child: const GuidelineSettings()),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () => ref
            .watch(guidelinesIssueProvider.notifier)
            .fetch(ref.watch(guidelineSelectedIndexProvider)),
        child: guidelinesIssue.when(
            skipError: true,
            data: (guidelines) {
              final activeFont = ref.watch(fontProvider).size;
              if (guidelines.issuesList.isNotEmpty) {
                final List<GuideLinesIssue> list = guidelines.issuesList;
                final Map<String, Widget> widgetList =
                    SplayTreeMap<String, Widget>((a, b) => a.compareTo(b));
                for (var guideline in list) {
                  List<Widget> children = [];
                  children.add(Wrap(
                    children: [GroupNameText(guideline: guideline)],
                  ));
                  Map<GuideLinesIssue, Widget> subGroup =
                      SplayTreeMap((a, b) => a.title.compareTo(b.title));
                  for (var element in list) {
                    if (element.group == guideline.group) {
                      subGroup.addAll(
                          {element: GuidelineListTile(element: element)});
                    }
                  }
                  children.addAll(subGroup.values);
                  widgetList.addAll({
                    guideline.group: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    )
                  });
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: ActiveInactiveButton()),
                    ),
                    Expanded(
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemBuilder: (context, index) =>
                              widgetList.entries.elementAt(index).value,
                          separatorBuilder: (context, index) => Divider(
                                color: ref.watch(darkModeProvider)
                                    ? Colors.white
                                    : Colors.transparent,
                                thickness: 1,
                              ),
                          itemCount: widgetList.length),
                    ),
                  ],
                );
              } else {
                return CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Center(
                        child: Text(
                          "No Article found",
                          style: TextStyle(
                            fontSize: isIpad
                                ? (CustomThemes().gettheme().fontsize3 +
                                        CustomThemes()
                                            .gettheme()
                                            .ipadfontsize) *
                                    activeFont
                                : CustomThemes().gettheme().fontsize3 *
                                    activeFont,
                            fontWeight: FontWeight.bold,
                            color: ref.watch(darkModeProvider)
                                ? CustomThemes().gettheme().whitecolor
                                : CustomThemes().gettheme().bgColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
            error: (error, stackTrace) => CustomScrollView(slivers: [
                  SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '404',
                            style: TextStyle(
                              color: ref.watch(darkModeProvider)
                                  ? CustomThemes().gettheme().whitecolor
                                  : CustomThemes().gettheme().bgColor,
                              fontSize: isIpad
                                  ? 40 + CustomThemes().gettheme().ipadfontsize
                                  : 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'NOT FOUND',
                            style: TextStyle(
                              color: ref.watch(darkModeProvider)
                                  ? CustomThemes().gettheme().whitecolor
                                  : CustomThemes().gettheme().bgColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
            loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                )),
      ),
    );
  }
}
