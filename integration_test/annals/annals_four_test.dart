import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/screens/collection/collection_screen.dart';
import 'package:acp_app/view/screens/main_screen/main_screen.dart';
import 'package:acp_app/view/screens/settings/settings.dart';
import 'package:acp_app/view/screens/splash_screen/splash_screen.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper/test_helper.dart';

void main() {
  Flavor? flavor;
  setUpAll(() {
    flavor = Flavor.annals;
  });
  group('Settings page', () {
    testWidgets('Tap SettingsPage in MainScreen', (tester) async {
      TestHelper.loadApp(flavor!);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.pumpAndSettle(); //// firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 15));
      await tester.pumpAndSettle(); // api call

      expect(find.byType(MainScreen), findsOneWidget);
      expect(find.byType(Navigator), findsAtLeast(1));
      expect(find.byType(SnakeNavigationBar), findsOneWidget);

      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                CustomThemes().gettheme().collections,
      )); //To find Collection page
      await tester.pumpAndSettle();
      expect(
          find.byType(CollectionPage), findsOneWidget); //To tap Collection page
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                CustomThemes().gettheme().issue,
      )); //To find Issue page
      await tester.pumpAndSettle();
      expect(find.byType(ArticleWebView), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                CustomThemes().gettheme().multimedia,
      )); //To tap multimedia page
      await tester.pumpAndSettle();
      expect(find.byType(ArticleWebView),
          findsOneWidget); //To find multimedia page
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                CustomThemes().gettheme().settings,
      )); //To find Settings page
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage),
          findsOneWidget); //To find SettingsPage page
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      expect(find.text('Sign In'), findsOneWidget); //To find Sign In Button
      expect(find.text('Bookmarks'), findsOneWidget); //To find Bookmarks Button
      expect(find.text('Small'), findsOneWidget); //To find Small Button
      expect(find.text('Medium'), findsOneWidget); //To find Medium Button
      expect(find.text('Large'), findsOneWidget); //To find Large Button

      await tester.tap(find.text('Small')); //To tap Small Button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.tap(find.text('Large')); //To tap Large Button
      expect(find.text('Appearance'), findsOneWidget); //To find Appearance text
      expect(find.text('Light'), findsOneWidget); //To find Light button
      await tester.tap(find.text('Light')); //To tap Light button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      expect(find.text('Dark'), findsOneWidget); //To find Dark button
      await tester.tap(find.text('Dark')); //To tap Dark button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.pump();
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                CustomThemes().gettheme().collections,
      )); //To tap collections button
      await tester.pumpAndSettle(const Duration(seconds: 5));
      expect(find.text('ACP Journal Club'), findsOne);
      expect(find.text('Beyond the Guidelines'), findsOne);
      expect(find.text('Clinical Guidelines'), findsOne);
      expect(find.text('In the Clinic'), findsOne);
      expect(find.text('On Being a Doctor'), findsOne);
      expect(find.text('Original Research'), findsOne);
      await tester.scrollUntilVisible(find.text("Reviews"), 5);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(find.text('Reviews'), findsOne);
    });
  });
}
