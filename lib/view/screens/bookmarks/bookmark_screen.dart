import 'dart:io';

import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_annals.dart';
import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/view_utils/readmore.dart';
import 'package:acp_app/view/widgets/rounded_text_container.dart';
import 'package:acp_app/view/widgets/secondary_appbar.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view_model/providers/article_provider.dart';
import 'package:acp_app/view_model/providers/boomarks_provider.dart';
import 'package:acp_app/view_model/providers/currentissue_provider.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/widgets/non_bottom_navigation_app_bar.dart';

class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({super.key});

  @override
  ConsumerState<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends ConsumerState<BookmarkScreen> {
  int isBookmarked = 1;
  int free = 1;
  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Map<String, dynamic>>> article =
        ref.watch(bookmarkProvider);
    ref.watch(fontProvider.notifier).loadDefaultFonts();
    double activeFont = ref.watch(fontProvider).size;
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: ref.watch(darkModeProvider)
          ? CustomThemes().gettheme().darkmodeblack
          : CustomThemes().gettheme().whitecolor,
      appBar: CustomThemes().projectname == 'annals'
          ? const NonBottomNavigationAppBar()
          : CustomThemes().projectname == 'aimcc'
              ? const SecondaryAppBar(title: "Bookmarks")
              : AppBar(),
      body: Container(
        // Wrap SingleChildScrollView with Container
        alignment: Alignment.topLeft, // Ensure content starts from top-left
        child: SingleChildScrollView(
          child: article.when(
            data: (list) {
              if (list.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 320.0),
                    child: Text(
                      'No bookmarks found',
                      style: TextStyle(
                        color: ref.watch(darkModeProvider)
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().bgColor,
                        fontSize: isIpad
                            ? (CustomThemes().gettheme().fontsize3 +
                                    CustomThemes().gettheme().ipadfontsize) *
                                activeFont
                            : CustomThemes().gettheme().fontsize3 * activeFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (Map<String, dynamic> item in list)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleWebView(
                                      key: const GlobalObjectKey<
                                              ArticleWebViewState>(
                                          PageName.settingsPage),
                                      articleItem: item,
                                      addAppBar: true,
                                      addMagnifierButton: true,
                                      enableDownload: true,
                                      backButtonHandler: true))),
                          child: bookmarkContainer(item, activeFont),
                        ),
                      ),
                  ],
                );
              }
            },
            error: (error, stackTrace) =>
                ErrorWidget.withDetails(message: error.toString()),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
          ),
        ),
      ),
    );
  }

  Widget bookmarkContainer(index, activeFont) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    final BookmarksNotifier allBookmarkNotifier =
        ref.read(bookmarkProvider.notifier);
    final bool isDark = ref.watch(darkModeProvider);
    double activeFont = ref.watch(fontProvider).size;
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: isDark
              ? CustomThemes().gettheme().darkmodegrey
              : CustomThemes()
                  .gettheme()
                  .whitecolor, // Set the background color to white
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: isDark
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(
                        0, 3), // changes the position of the shadow
                  ),
                ],
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Semantics(
                      label: "title : ${index['title'].toString()}",
                      excludeSemantics: true,
                      child: Text(
                        index['title'].toString().isEmpty
                            ? ""
                            : index['title'].toString(),
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
                            color: isDark
                                ? CustomThemes().gettheme().whitecolor
                                : CustomThemes().gettheme().black,
                            fontFamily: CustomThemes().gettheme().font1),
                      )),
                ),
              ),
              if (F.appFlavor == Flavor.annals)
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: FocusScope(
                      child: index['isFree'] == free
                          ? Semantics(
                              excludeSemantics: true,
                              label: 'free article',
                              child: const RoundedTextContainer(
                                text: 'Free',
                              ),
                            )
                          : Container(),
                    )),
              FocusScope(
                child: Semantics.fromProperties(
                  excludeSemantics: true,
                  properties: const SemanticsProperties(
                    label: 'Remove bookmark Double tap to activate',
                  ),
                  child: GestureDetector(
                      onTap: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Bookmark removed'),
                          ),
                        );
                        await allBookmarkNotifier.updateBookMarks(index);
                        if (F.appFlavor == Flavor.annals) {
                          await ref
                              .watch(currentIssueArticlesProvider.notifier)
                              .getUpdatedIssues();
                        }
                        await ref
                            .read(allArticlesProvider.notifier)
                            .updateArticles();
                        await AnalyticsService.userInteractionTrack();
                      },
                      child: Icon(Icons.bookmark_added,
                          size: 28,
                          color: isDark
                              ? CustomThemes().gettheme().whitecolor
                              : CustomThemes().gettheme().bgColor)),
                ),
              ),
            ]),
            if (index['author'].toString().isNotEmpty)
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Semantics(
                        excludeSemantics: true,
                        label: "author : ${index['author'].toString()}",
                        child: Text(
                          index['author'].toString(),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: isIpad
                                  ? (CustomThemes().gettheme().fontsize1 +
                                          CustomThemes()
                                              .gettheme()
                                              .ipadfontsize) *
                                      activeFont
                                  : CustomThemes().gettheme().fontsize1 *
                                      activeFont,
                              fontFamily: CustomThemes().gettheme().font2,
                              fontWeight: FontWeight.w400,
                              color: isDark
                                  ? CustomThemes().gettheme().whitecolor
                                  : CustomThemes().gettheme().black),
                        ),
                      ))),
            if (index['description'].toString().isNotEmpty)
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: index['description'].toString().length > 200 && !isIpad
                      ? Semantics(
                          excludeSemantics: true,
                          label:
                              "description : ${index['description'].toString()}",
                          child: ReadMoreText(
                              text: index['description'].toString(),
                              maxLines:
                                  3, // Adjust the number of lines to display initially
                              style: TextStyle(
                                fontSize: isIpad
                                    ? (CustomThemes().gettheme().fontsize1 +
                                            CustomThemes()
                                                .gettheme()
                                                .ipadfontsize) *
                                        activeFont
                                    : CustomThemes().gettheme().fontsize1 *
                                        activeFont,
                                fontFamily: CustomThemes().gettheme().font2,
                                color: isDark
                                    ? CustomThemes().gettheme().whitecolor
                                    : CustomThemes().gettheme().blackgrayshadow,
                              )),
                        )
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: Semantics(
                            excludeSemantics: true,
                            label:
                                "description : ${index['description'].toString()}",
                            child: Text(
                              index['description'].toString(),
                              style: TextStyle(
                                fontSize: isIpad
                                    ? (CustomThemes().gettheme().fontsize1 +
                                            CustomThemes()
                                                .gettheme()
                                                .ipadfontsize) *
                                        activeFont
                                    : CustomThemes().gettheme().fontsize1 *
                                        activeFont,
                                fontFamily: CustomThemes().gettheme().font2,
                                color: isDark
                                    ? CustomThemes().gettheme().whitecolor
                                    : CustomThemes().gettheme().blackgrayshadow,
                              ),
                            ),
                          ),
                        )),
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 10, 5, 0),
              child: Row(
                children: [
                  if (index['type'].toString().isNotEmpty)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? CustomThemes().gettheme().whitecolor
                              : CustomThemes().gettheme().typedarkbgcolor,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 30,
                        ),
                        child: Flex(direction: Axis.horizontal, children: [
                          Semantics(
                              excludeSemantics: true,
                              label: "type : ${index['type'].toString()}",
                              child: Text(
                                index['type'].toString().isEmpty
                                    ? ""
                                    : index['type'].toString().length >= 18
                                        ? '${index['type'].toString().substring(0, 18)}... '
                                        : index['type'].toString(),
                                style: TextStyle(
                                  color: isDark
                                      ? CustomThemes().gettheme().darkmodeblack
                                      : CustomThemes().gettheme().whitecolor,
                                  fontFamily: CustomThemes().gettheme().font2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isIpad
                                      ? (CustomThemes().gettheme().fontsize2 +
                                              CustomThemes()
                                                  .gettheme()
                                                  .ipadfontsize) *
                                          activeFont
                                      : CustomThemes().gettheme().fontsize2 *
                                          activeFont,
                                ),
                              )),
                        ]),
                      ),
                    ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                      child: Semantics(
                          excludeSemantics: true,
                          label: Platform.isIOS
                              ? "published Date : ${index['pubDate'].toString()} Double tap to activate"
                              : "published Date : ${index['pubDate'].toString()}",
                          child: Text(
                              index['pubDate'].toString().isEmpty
                                  ? ""
                                  : index['pubDate'].toString(),
                              style: TextStyle(
                                fontSize: isIpad
                                    ? (CustomThemes().gettheme().fontsize2 +
                                            CustomThemes()
                                                .gettheme()
                                                .ipadfontsize) *
                                        activeFont
                                    : CustomThemes().gettheme().fontsize2 *
                                        activeFont,
                                fontWeight: FontWeight.bold,
                                fontFamily: CustomThemes().gettheme().font2,
                                color: isDark
                                    ? CustomThemes().gettheme().whitecolor
                                    : CustomThemes().gettheme().blackgrayshadow,
                              )))),
                ],
              ),
            )
          ],
        ));
  }
}
