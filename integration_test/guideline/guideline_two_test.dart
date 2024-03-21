import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/screens/guidline_screen/main_screen_guidelines.dart';
import 'package:acp_app/view/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper/test_helper.dart';

void main() {
  Flavor? flavor;
  setUpAll(() {
    flavor = Flavor.guidelines;
  });

  group('Guideline Test', () {
    testWidgets('Guideline webview test', (tester) async {
      TestHelper.loadApp(flavor!);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.pumpAndSettle(); //// firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 15));
      await tester.pumpAndSettle(); // api call
      expect(find.byType(GuidelinesMainScreen), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey("value")).first);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(GuidelineWebView), findsOneWidget);
      expect(find.byIcon(Icons.list), findsOneWidget);
      await tester.tap(find.byIcon(Icons.list));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(OutlinedButton), findsAtLeast(1));
      await tester.tap(find.byType(OutlinedButton).first);
      expect(find.byType(GuidelineWebView), findsOneWidget);
    });
  });
}
