import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/article_screen/article_screen.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/screens/collection/collection_screen.dart';
import 'package:acp_app/view/screens/main_screen/main_screen.dart';
import 'package:acp_app/view/screens/splash_screen/splash_screen.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper/test_helper.dart';

void main() {
  Flavor? flavor;
  setUpAll(() {
    flavor = Flavor.annals;
  });

  group('Annals', () {
    testWidgets('Test cases for ariticle and current issue page',
        (WidgetTester tester) async {
      // Build your widget
      TestHelper.loadApp(flavor!);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.pumpAndSettle(); // firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 15));
      await tester.pumpAndSettle();
      expect(find.byType(MainScreen), findsOneWidget);

      expect(find.byType(ArticleScreen), findsOneWidget);

      final gestureDetectorFinder =
          find.byKey(const ValueKey('bookmark')).first;

      // expect(gestureDetectorFinder, findsOneWidget);

      // Simulate a tap on the GestureDetector
      await tester.tap(gestureDetectorFinder);

      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().issue));
      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().issue));
      expect(find.byType(ArticleWebView), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 15));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().collections));
      await tester.pumpAndSettle(const Duration(seconds: 15));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().collections));

      expect(find.byType(CollectionPage), findsOneWidget);

      await tester.pumpAndSettle();
    });
  });
}
