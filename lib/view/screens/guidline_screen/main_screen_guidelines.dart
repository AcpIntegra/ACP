import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_guidelines.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/screens/guidline_screen/guidelines_full_list.dart';
import 'package:acp_app/view/view_utils/navigation_callback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidelinesMainScreen extends ConsumerWidget {
  const GuidelinesMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigatorPopHandler(
      onPop: () => NavigatorCallback.guidelineWebViewPopBackHandler(
          key: GlobalObjectKey<GuidelineWebViewState>(
              MainPagesGuidelines().pageName),
          naviagtorKey: MainPagesGuidelines().pageKey),
      child: Navigator(
          key: MainPagesGuidelines().pageKey,
          initialRoute: MainPagesGuidelines().pageName,
          onGenerateRoute: (settings) {
            if (settings.name == MainPagesGuidelines().pageName) {
              return MaterialPageRoute(builder: (context) {
                return const GuidelinesFullList();
              });
            } else {
              return null;
            }
          }),
    );
  }
}
