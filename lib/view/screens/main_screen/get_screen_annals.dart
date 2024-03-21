import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_annals.dart';
import 'package:acp_app/view/screens/article_screen/article_screen.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/screens/collection/collection_screen.dart';
import 'package:acp_app/view/screens/settings/settings.dart';
import 'package:acp_app/view/view_utils/navigation_callback.dart';
import 'package:acp_app/view/widgets/regular_appbar.dart';
import 'package:acp_app/view_model/main_screen_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetScreenAnnals extends ConsumerWidget {
  const GetScreenAnnals({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(indexProvider);

    switch (selectedIndex) {
      case 0:
        return NavigatorPopHandler(
            onPop: () async =>
                await NavigatorCallback.articleWebViewPopBackHandler(
                    key: const GlobalObjectKey<ArticleWebViewState>(
                        PageName.articlePage),
                    naviagtorKey: MainPagesAnnals().articlePage.pageKey),
            child: Navigator(
                key: MainPagesAnnals().articlePage.pageKey,
                initialRoute: MainPagesAnnals().articlePage.page.name,
                onGenerateRoute: (RouteSettings settings) {
                  if (settings.name ==
                      MainPagesAnnals().articlePage.page.name) {
                    return MaterialPageRoute(builder: (context) {
                      return const Scaffold(
                        appBar: RegularAppbar(),
                        body: ArticleScreen(),
                      );
                    });
                  } else {
                    return null;
                  }
                }));

      case 1:
        return NavigatorPopHandler(
          onPop: () async =>
              await NavigatorCallback.articleWebViewPopBackHandler(
                  key: const GlobalObjectKey<ArticleWebViewState>(
                      PageName.issuePage),
                  naviagtorKey: MainPagesAnnals().issuePage.pageKey),
          child: Builder(builder: (context) {
            return Navigator(
                key: MainPagesAnnals().issuePage.pageKey,
                initialRoute: MainPagesAnnals().issuePage.page.name,
                onGenerateRoute: (RouteSettings settings) {
                  if (settings.name == MainPagesAnnals().issuePage.page.name) {
                    return MaterialPageRoute(builder: (context) {
                      return const Scaffold(
                          appBar: RegularAppbar(),
                          body: ArticleWebView(
                              key: GlobalObjectKey<ArticleWebViewState>(
                                  PageName.issuePage),
                              enableDownload: true,
                              addAppBar: false,
                              addMagnifierButton: false,
                              backButtonHandler: true,
                              articleItem: {
                                'link':
                                    'https://www.acpjournals.org/toc/aim/current',
                                'id': 'issueoffline'
                              }));
                    });
                  } else {
                    return null;
                  }
                });
          }),
        );

      case 2:
        return NavigatorPopHandler(
          onPop: () async =>
              await NavigatorCallback.articleWebViewPopBackHandler(
                  key: const GlobalObjectKey<ArticleWebViewState>(
                      PageName.multimediaPage),
                  naviagtorKey: MainPagesAnnals().multimediaPage.pageKey),
          child: Navigator(
              key: MainPagesAnnals().multimediaPage.pageKey,
              initialRoute: MainPagesAnnals().multimediaPage.page.name,
              onGenerateRoute: (RouteSettings settings) {
                if (settings.name ==
                    MainPagesAnnals().multimediaPage.page.name) {
                  return MaterialPageRoute(builder: (context) {
                    return const Scaffold(
                      appBar: RegularAppbar(),
                      body: ArticleWebView(
                        key: GlobalObjectKey<ArticleWebViewState>(
                            PageName.multimediaPage),
                        articleItem: {
                          'link':
                              'https://www.acpjournals.org/journal/aim/multimedia',
                          'id': 'multimedia'
                        },
                        backButtonHandler: true,
                        addAppBar: false,
                        addMagnifierButton: false,
                        enableDownload: true,
                      ),
                    );
                  });
                } else {
                  return null;
                }
              }),
        );

      case 3:
        return NavigatorPopHandler(
          onPop: () => NavigatorCallback.articleWebViewPopBackHandler(
              key: const GlobalObjectKey<ArticleWebViewState>(
                  PageName.collectionPage),
              naviagtorKey: MainPagesAnnals().collectionPage.pageKey),
          child: Navigator(
              key: MainPagesAnnals().collectionPage.pageKey,
              initialRoute: MainPagesAnnals().collectionPage.page.name,
              onGenerateRoute: (RouteSettings settings) {
                if (settings.name ==
                    MainPagesAnnals().collectionPage.page.name) {
                  return MaterialPageRoute(builder: (context) {
                    return const Scaffold(
                      appBar: RegularAppbar(),
                      body: CollectionPage(),
                    );
                  });
                } else {
                  return null;
                }
              }),
        );

      case 4:
        return NavigatorPopHandler(
          onPop: () => NavigatorCallback.articleWebViewPopBackHandler(
              key: const GlobalObjectKey<ArticleWebViewState>(
                  PageName.settingsPage),
              naviagtorKey: MainPagesAnnals().settingsPage.pageKey),
          child: Navigator(
              key: MainPagesAnnals().settingsPage.pageKey,
              initialRoute: MainPagesAnnals().settingsPage.page.name,
              onGenerateRoute: (RouteSettings settings) {
                if (settings.name == MainPagesAnnals().settingsPage.page.name) {
                  return MaterialPageRoute(builder: (context) {
                    return const Scaffold(
                      appBar: RegularAppbar(),
                      body: SettingsPage(),
                    );
                  });
                } else {
                  return null;
                }
              }),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
