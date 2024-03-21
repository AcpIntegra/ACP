import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_aimcc.dart';
import 'package:acp_app/view/screens/archives_screen/archives_screen.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/screens/settings/settings.dart';
import 'package:acp_app/view/view_utils/navigation_callback.dart';
import 'package:acp_app/view/widgets/regular_appbar.dart';
import 'package:acp_app/view_model/main_screen_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetScreenAimcc extends StatelessWidget {
  const GetScreenAimcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final int selectedIndex = ref.watch(indexProvider);
      switch (selectedIndex) {
        case 0:
          return NavigatorPopHandler(
            onPop: () async => NavigatorCallback.articleWebViewPopBackHandler(
                key: const GlobalObjectKey<ArticleWebViewState>(
                    PageName.inProgressPage),
                naviagtorKey: MainPagesAimcc().inProgressPage.pageKey),
            child: Navigator(
                key: MainPagesAimcc().inProgressPage.pageKey,
                initialRoute: MainPagesAimcc().inProgressPage.page.name,
                onGenerateRoute: (RouteSettings settings) {
                  if (settings.name ==
                      MainPagesAimcc().inProgressPage.page.name) {
                    return MaterialPageRoute(builder: (context) {
                      return const Scaffold(
                        appBar: RegularAppbar(),
                        body: ArticleWebView(
                            enableDownload: true,
                            backButtonHandler: true,
                            addAppBar: false,
                            addMagnifierButton: false,
                            key: GlobalObjectKey<ArticleWebViewState>(
                                PageName.inProgressPage),
                            articleItem: {
                              'link':
                                  'https://www.acpjournals.org/toc/aimcc/current',
                              'id': 'aimccInProgress'
                            }),
                      );
                    });
                  } else {
                    return null;
                  }
                }),
          );

        case 1:
          return NavigatorPopHandler(
            onPop: () => NavigatorCallback.articleWebViewPopBackHandler(
                key: const GlobalObjectKey<ArticleWebViewState>(
                    PageName.archivesPage),
                naviagtorKey: MainPagesAimcc().archivesPage.pageKey),
            child: Navigator(
                key: MainPagesAimcc().archivesPage.pageKey,
                initialRoute: MainPagesAimcc().archivesPage.page.name,
                onGenerateRoute: (RouteSettings settings) {
                  if (settings.name ==
                      MainPagesAimcc().archivesPage.page.name) {
                    return MaterialPageRoute(builder: (context) {
                      return const Scaffold(
                        appBar: RegularAppbar(),
                        body: ArchivesPage(),
                      );
                    });
                  } else {
                    return null;
                  }
                }),
          );
        case 2:
          return NavigatorPopHandler(
            onPop: () =>
                MainPagesAimcc().settingsPage.pageKey.currentState!.pop(),
            child: Navigator(
                key: MainPagesAimcc().settingsPage.pageKey,
                initialRoute: MainPagesAimcc().settingsPage.page.name,
                onGenerateRoute: (RouteSettings settings) {
                  if (settings.name ==
                      MainPagesAimcc().settingsPage.page.name) {
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
    });
  }
}
