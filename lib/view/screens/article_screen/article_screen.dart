import 'dart:io';

import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_annals.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/view_utils/readmore.dart';
import 'package:acp_app/view/widgets/secondary_appbar.dart';
import 'package:acp_app/view_model/providers/article_provider.dart';
import 'package:acp_app/view_model/providers/boomarks_provider.dart';
import 'package:acp_app/view_model/providers/currentissue_provider.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/rounded_text_container.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ArticleScreen extends ConsumerStatefulWidget {
  const ArticleScreen({super.key});

  @override
  ConsumerState<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends ConsumerState<ArticleScreen> {
  List<Map<String, dynamic>> articleslists = [];
  List<Map<String, dynamic>> articleslistsbookmark = [];
  int isBookmarked = 1;
  int free = 1;
  bool bookmark = false;
  String volume = '';
  String issue = '';
  String monthYear = '';
  BannerAd? _bannerAd;
  final AdSize adSize = const AdSize(width: 300, height: 50);
  bool _bannerIsLoaded = false;

  @override
  void initState() {
    super.initState();

    _bannerAd = BannerAd(
      adUnitId: "/11548178/Annals_App_1",
      size: adSize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('$BannerAd loaded.');
          setState(() {
            _bannerIsLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => debugPrint('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => debugPrint('$BannerAd onAdClosed.'),
      ),
    )..load();
  }

  //  final BannerAdListener bannerListner = BannerAdListener(
  //   onAdLoaded:(ad) => debugPrint('Ad Loaded'),
  //   onAdFailedToLoad: (ad, error)  {
  //     ad.dispose();
  //     debugPrint('Ad failed to load');

  //   },
  //   onAdOpened: (ad) => debugPrint('Ad Opened'),
  //   onAdClosed:(ad) => debugPrint('Ad Closed'),
  // );

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Map<String, dynamic>>> article =
        ref.watch(allArticlesProvider);
    final bool isDark = ref.watch(darkModeProvider);
    ref.watch(fontProvider.notifier).loadDefaultFonts();
    double activeFont = ref.watch(fontProvider).size;
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;

    return FocusScope(
      child: Semantics(
        label: F.appFlavor == Flavor.annals
            ? 'Article Screen'
            : F.appFlavor == Flavor.aimcc
                ? 'In Progress Screen'
                : '',
        child: Scaffold(
          appBar: F.appFlavor == Flavor.aimcc
              ? const SecondaryAppBar(title: "In Progress")
              : null,
          body: Center(
            child: article.when(
              data: (list) => list.isEmpty
                  ? Text(
                      "No article found",
                      style: TextStyle(
                        fontSize: isIpad
                            ? (CustomThemes().gettheme().fontsize3 +
                                    CustomThemes().gettheme().ipadfontsize) *
                                activeFont
                            : CustomThemes().gettheme().fontsize3 * activeFont,
                        fontWeight: FontWeight.bold,
                        color: CustomThemes().gettheme().bgColor,
                      ),
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        if (F.appFlavor != Flavor.aimcc &&
                            list.isNotEmpty &&
                            _bannerIsLoaded)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: SizedBox(
                                width: 300.0,
                                height: 50.0,
                                child: AdWidget(
                                  ad: _bannerAd!,
                                )),
                          )
                        else if (F.appFlavor != Flavor.aimcc &&
                            list.isNotEmpty &&
                            !_bannerIsLoaded)
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: SizedBox(
                              width: 300.0,
                              height: 50.0,
                            ),
                          ), // Include only when not aimcc
                        if (F.appFlavor == Flavor.aimcc)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(32, 16, 0, 16),
                                child: Semantics(
                                  label: "Preview of Cover Image",
                                  child: ExcludeSemantics(
                                    child: Image.asset(
                                      CustomThemes().gettheme().inprogress,
                                      height: 156.0,
                                      width: 134,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '$monthYear\nVolume $volume, Issue $issue',
                                    style: TextStyle(
                                      fontFamily:
                                          CustomThemes().gettheme().font1,
                                      fontWeight: FontWeight.w400,
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
                                ),
                              )
                            ],
                          ),
                        if (F.appFlavor != Flavor.aimcc)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Semantics(
                              label: 'Latest',
                              excludeSemantics: true,
                              child: Text(
                                "LATEST",
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
                                      : CustomThemes().gettheme().bgColor,
                                ),
                              ),
                            ),
                          ),
                        for (Map<String, dynamic> item in list)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 4, 10, 10),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleWebView(
                                    key: const GlobalObjectKey<
                                            ArticleWebViewState>(
                                        PageName.articlePage),
                                    addAppBar: true,
                                    addMagnifierButton: true,
                                    backButtonHandler: true,
                                    enableDownload: true,
                                    articleItem: item,
                                  ),
                                ),
                              ),
                              child: articleContainer(item, ref),
                            ),
                          )
                      ],
                    ),
              error: (error, stackTrace) =>
                  ErrorWidget.withDetails(message: error.toString()),
              loading: () => const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }

  Widget addsContainer() {
    return Semantics(
      label: "Advertisement Double tap to activate",
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
        child: GestureDetector(
          child: const ExcludeSemantics(
            child: Image(
              image: AssetImage("asset/image/coco.png"),
            ),
          ),
        ),
      ),
    );
  }

  Widget articleContainer(Map<String, dynamic> index, WidgetRef ref) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    final AllArticleNotifer allArticleNotifer =
        ref.read(allArticlesProvider.notifier);
    final bool isDark = ref.watch(darkModeProvider);
    double activeFont = ref.watch(fontProvider).size;
    String description = index['description'].toString();
    List<String> parts = description.split(', ');
    for (String part in parts) {
      if (part.startsWith('Volume')) {
        volume = part.substring(7);
      } else if (part.startsWith('Issue')) {
        issue = part.substring(6);
      } else if (part.contains(RegExp(r'[A-Za-z]'))) {
        monthYear = part.replaceAll('.', '');
      }
    }

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
                      FocusScope(
                        child: Semantics.fromProperties(
                          excludeSemantics: true,
                          properties: index['is_bookmarked'] == 1
                              ? const SemanticsProperties(
                                  label:
                                      'Remove bookmark Double tap to activate')
                              : const SemanticsProperties(
                                  label: 'Add bookmark Double tap to activate'),
                          child: GestureDetector(
                            key: const ValueKey('bookmark'),
                            onTap: () async {
                              if (index['is_bookmarked'] == 1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Bookmark removed'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Bookmark added'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                              await allArticleNotifer.updateBookMark(index);
                              await ref
                                  .watch(bookmarkProvider.notifier)
                                  .updateBookmarkedArticles();
                              if (F.appFlavor == Flavor.annals) {
                                await ref
                                    .watch(
                                        currentIssueArticlesProvider.notifier)
                                    .getUpdatedIssues();
                              }

                              await AnalyticsService.userInteractionTrack();
                            },
                            child: index['is_bookmarked'] == isBookmarked
                                ? Icon(Icons.bookmark_added,
                                    size: 28,
                                    color: isDark
                                        ? CustomThemes().gettheme().whitecolor
                                        : CustomThemes().gettheme().bgColor)
                                : Icon(Icons.bookmark_add_outlined,
                                    size: 28,
                                    color: isDark
                                        ? CustomThemes().gettheme().whitecolor
                                        : CustomThemes().gettheme().bgColor),
                          ),
                        ),
                      ),
                    ])),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: LayoutBuilder(builder: (context, constraints) {
                return bookmark
                    ? const Image(
                        image: AssetImage('asset/image/doc.png'),
                      )
                    : Container();
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
                              : index['author'].toString().trim(),
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
                              fontWeight: FontWeight.w400,
                              fontFamily: CustomThemes().gettheme().font2,
                              color: isDark
                                  ? CustomThemes().gettheme().whitecolor
                                  : CustomThemes().gettheme().black),
                        )),
                  )),
            if (index['description'].toString().isNotEmpty)
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Semantics(
                      excludeSemantics: true,
                      label: "discription : ${index['description'].toString()}",
                      child: index['description'].toString().length > 200 &&
                              !isIpad
                          ? ReadMoreText(
                              text: description,
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
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: Semantics(
                                  label:
                                      "discription : ${index['description'].toString()}",
                                  child: Text(
                                    index['description']
                                        .toString(), // Adjust the number of lines to display initially
                                    style: TextStyle(
                                      fontSize: isIpad
                                          ? (CustomThemes()
                                                      .gettheme()
                                                      .fontsize1 +
                                                  CustomThemes()
                                                      .gettheme()
                                                      .ipadfontsize) *
                                              activeFont
                                          : CustomThemes()
                                                  .gettheme()
                                                  .fontsize1 *
                                              activeFont,
                                      fontFamily:
                                          CustomThemes().gettheme().font2,
                                      color: isDark
                                          ? CustomThemes().gettheme().whitecolor
                                          : CustomThemes()
                                              .gettheme()
                                              .blackgrayshadow,
                                    ),
                                  )),
                            ))),
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
                                      : index['type'].toString().length >= 16
                                          ? '${index['type'].toString().substring(0, 16)}...'
                                          : index['type'].toString(),
                                  style: TextStyle(
                                    color: isDark
                                        ? CustomThemes()
                                            .gettheme()
                                            .darkmodeblack
                                        : CustomThemes().gettheme().whitecolor,
                                    fontFamily: CustomThemes().gettheme().font2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isIpad
                                        ? (CustomThemes().gettheme().fontsize1 +
                                                CustomThemes()
                                                    .gettheme()
                                                    .ipadfontsize) *
                                            activeFont
                                        : CustomThemes().gettheme().fontsize1 *
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
                                        ? (CustomThemes().gettheme().fontsize1 +
                                                CustomThemes()
                                                    .gettheme()
                                                    .ipadfontsize) *
                                            activeFont
                                        : CustomThemes().gettheme().fontsize1 *
                                            activeFont,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: CustomThemes().gettheme().font2,
                                    color: isDark
                                        ? CustomThemes().gettheme().whitecolor
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
        ));
  }
}
