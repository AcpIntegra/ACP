import 'dart:io';

import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_annals.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/view_utils/readmore.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view/widgets/bookmark_widget.dart';
import 'package:acp_app/view/widgets/rounded_text_container.dart';
import 'package:acp_app/view_model/providers/collection_provider.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverallCollection extends ConsumerStatefulWidget {
  const OverallCollection({super.key, required this.title});
  final String title;

  @override
  ConsumerState<OverallCollection> createState() => _CollectionPageState();
}

class _CollectionPageState extends ConsumerState<OverallCollection> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Map<String, dynamic>>> collections =
        ref.watch(collectionProvider(widget.title));
    final CollectionNotifer collectionNotifer =
        ref.watch(collectionProvider(widget.title).notifier);
    ref.watch(fontProvider.notifier).loadDefaultFonts();
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    String returningTitle(name) {
      if (name == TableNames.acpJournalClub) {
        return 'ACP Journal Club';
      } else if (name == TableNames.beyondTheGuildelines) {
        return 'Beyond the Guidelines';
      } else if (name == TableNames.clinicalGuidelines) {
        return 'Clinical Guidelines';
      } else if (name == TableNames.covid19) {
        return 'COVID-19';
      } else if (name == TableNames.inTheClinic) {
        return 'In the Clinic';
      } else if (name == TableNames.onBeingADoctor) {
        return 'On Being a Doctor';
      } else if (name == TableNames.originalResearch) {
        return 'Original Research';
      } else if (name == TableNames.reviews) {
        return 'Reviews';
      } else {
        return 'ACP Journal Club';
      }
    }

    String titleName = returningTitle(widget.title);
    return FocusScope(
        child: Semantics(
            label: titleName,
            child: collections.when(
                data: (list) => Scaffold(
                      appBar: AppBar(
                        backgroundColor: CustomThemes().gettheme().bgColor,
                        automaticallyImplyLeading: false,
                        title: Row(
                          children: [
                            FocusScope(
                              child: Semantics(
                                excludeSemantics: true,
                                label: 'Back button Double tap to activate',
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await AnalyticsService
                                          .userInteractionTrack();
                                    },
                                    child: Image.asset(
                                      CustomThemes()
                                          .gettheme()
                                          .leftarrow
                                          .toString(),
                                      width: 24.0,
                                      height: 24.0,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FocusScope(
                              child: Semantics(
                                excludeSemantics: true,
                                label: '$titleName heading',
                                child: Text(
                                  returningTitle(widget.title),
                                  style: TextStyle(
                                    color: CustomThemes().gettheme().whitecolor,
                                    fontFamily: CustomThemes().gettheme().font1,
                                    fontSize: isIpad
                                        ? 24 +
                                            CustomThemes()
                                                .gettheme()
                                                .ipadfontsize
                                        : 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      body: list.isEmpty
                          ? Semantics(
                              label: widget.title,
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 70.0),
                                    child: Text(
                                      "No article found",
                                      style: TextStyle(
                                        fontSize:
                                            16 * ref.watch(fontProvider).size,
                                        fontWeight: FontWeight.bold,
                                        color: ref.watch(darkModeProvider)
                                            ? CustomThemes()
                                                .gettheme()
                                                .whitecolor
                                            : CustomThemes().gettheme().bgColor,
                                      ),
                                    )),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(15),
                              child: ListView.builder(
                                  itemCount: list.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ArticleWebView(
                                                    key: const GlobalObjectKey<
                                                            ArticleWebViewState>(
                                                        PageName
                                                            .collectionPage),
                                                    addAppBar: true,
                                                    addMagnifierButton: true,
                                                    backButtonHandler: true,
                                                    enableDownload: true,
                                                    articleItem: list[index]))),
                                        child: articleContainer(list[index],
                                            ref, collectionNotifer),
                                      ))),
                    ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => const Text("Error"))));
  }

  Widget articleContainer(
      Map<String, dynamic> index, WidgetRef ref, CollectionNotifer notifier) {
    int isBookmarked = 1;
    int free = 1;
    double activeFont = ref.watch(fontProvider).size;
    bool isDark = ref.watch(darkModeProvider);
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Container(
        padding: const EdgeInsets.all(3),
        child: Container(
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
                Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Semantics(
                                  excludeSemantics: true,
                                  label: "title : ${index['title'].toString()}",
                                  child: Text(
                                    index['title'].toString().isEmpty
                                        ? ""
                                        : index['title'].toString(),
                                    style: TextStyle(
                                        fontSize: isIpad
                                            ? (CustomThemes()
                                                        .gettheme()
                                                        .fontsize3 +
                                                    CustomThemes()
                                                        .gettheme()
                                                        .ipadfontsize) *
                                                activeFont
                                            : CustomThemes()
                                                    .gettheme()
                                                    .fontsize3 *
                                                activeFont,
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? CustomThemes()
                                                .gettheme()
                                                .whitecolor
                                            : CustomThemes().gettheme().black,
                                        fontFamily:
                                            CustomThemes().gettheme().font1),
                                  ),
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(2),
                              child: FocusScope(
                                child: index['isFree'] == free
                                    ? Semantics(
                                        excludeSemantics: true,
                                        label: 'free article',
                                        child: const RoundedTextContainer(
                                            text: 'Free'))
                                    : Container(),
                              )),
                          BookmarkWidget(
                            item: index,
                            isBookmarked: isBookmarked,
                            notifier: notifier,
                            tablename: widget.title,
                          ),
                        ])),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container();
                  }),
                ),
                if (index['author'].toString().isNotEmpty)
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Semantics(
                            excludeSemantics: true,
                            label: "author : ${index['author'].toString()}",
                            child: Text(
                              index['author'].toString().isEmpty
                                  ? "No author"
                                  : index['author'].toString(),
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
                      child: index['description'].toString().length > 200 &&
                              !isIpad
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
                                      : CustomThemes()
                                          .gettheme()
                                          .blackgrayshadow,
                                ),
                              ))
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
                                        : CustomThemes()
                                            .gettheme()
                                            .blackgrayshadow,
                                  ),
                                ),
                              ),
                            )),
                Wrap(
                  spacing: 4.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: <Widget>[
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
                                      : CustomThemes()
                                          .gettheme()
                                          .typedarkbgcolor,
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                constraints: const BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 30,
                                ),
                                child:
                                    Flex(direction: Axis.horizontal, children: [
                                  Semantics(
                                    excludeSemantics: true,
                                    label:
                                        "type  : ${index['type'].toString()}",
                                    child: Text(
                                      index['type'].toString().isEmpty
                                          ? ""
                                          : index['type'].toString().length >=
                                                  18
                                              ? '${index['type'].toString().substring(0, 18)}... '
                                              : index['type'].toString(),
                                      style: TextStyle(
                                        color: isDark
                                            ? CustomThemes()
                                                .gettheme()
                                                .darkmodeblack
                                            : CustomThemes()
                                                .gettheme()
                                                .whitecolor,
                                        fontFamily:
                                            CustomThemes().gettheme().font2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isIpad
                                            ? (CustomThemes()
                                                        .gettheme()
                                                        .fontsize2 +
                                                    CustomThemes()
                                                        .gettheme()
                                                        .ipadfontsize) *
                                                activeFont
                                            : CustomThemes()
                                                    .gettheme()
                                                    .fontsize2 *
                                                activeFont,
                                      ),
                                    ),
                                  )
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
                                            ? (CustomThemes()
                                                        .gettheme()
                                                        .fontsize2 +
                                                    CustomThemes()
                                                        .gettheme()
                                                        .ipadfontsize) *
                                                activeFont
                                            : CustomThemes()
                                                    .gettheme()
                                                    .fontsize2 *
                                                activeFont,
                                        fontWeight: FontWeight.bold,
                                        fontFamily:
                                            CustomThemes().gettheme().font2,
                                        color: isDark
                                            ? CustomThemes()
                                                .gettheme()
                                                .whitecolor
                                            : CustomThemes()
                                                .gettheme()
                                                .blackgrayshadow,
                                      )))),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
