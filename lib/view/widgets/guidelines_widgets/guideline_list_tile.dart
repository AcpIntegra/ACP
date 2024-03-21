import 'dart:io';
import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_guidelines.dart';
import 'package:acp_app/data/models/guidelines/guidelines_issue.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view/widgets/rounded_text_container.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidelineListTile extends ConsumerWidget {
  const GuidelineListTile({super.key, required this.element});

  final GuideLinesIssue element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    final activeFont = ref.watch(fontProvider).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
      child: Row(
        children: [
          Platform.isAndroid
              ? Flexible(
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GuidelineWebView(
                                  key: GlobalObjectKey<GuidelineWebViewState>(
                                      MainPagesGuidelines().pageName),
                                  issue: element)));
                      await AnalyticsService.userInteractionTrack();
                    },
                    child: Ink(
                      child: HtmlWidget(
                        element.title, // Render HTML content
                        textStyle: TextStyle(
                          fontSize: isIpad
                              ? (CustomThemes().gettheme().fontsize2 +
                                      CustomThemes().gettheme().ipadfontsize) *
                                  activeFont
                              : CustomThemes().gettheme().fontsize2 *
                                  activeFont,
                          color: ref.watch(darkModeProvider)
                              ? Colors.white
                              : CustomThemes().gettheme().black,
                        ),
                      ),
                    ),
                  ),
                )
              : Flexible(
                  child: InkWell(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GuidelineWebView(issue: element)));
                    await AnalyticsService.userInteractionTrack();
                  },
                  child: Semantics(
                    excludeSemantics: true,
                    label: '${element.title} double tap to activate',
                    child: Ink(
                      child: HtmlWidget(
                        element.title, // Render HTML content
                        textStyle: TextStyle(
                          fontSize: isIpad
                              ? (CustomThemes().gettheme().fontsize2 +
                                      CustomThemes().gettheme().ipadfontsize) *
                                  activeFont
                              : CustomThemes().gettheme().fontsize2 *
                                  activeFont,
                          color: ref.watch(darkModeProvider)
                              ? Colors.white
                              : CustomThemes().gettheme().black,
                        ),
                      ),
                    ),
                  ),
                )),
          if (element.newArticle)
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Semantics(
                  label: 'Newly added article',
                  child: const RoundedTextContainer(text: 'New')),
            )
        ],
      ),
    );
  }
}
