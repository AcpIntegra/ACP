import 'dart:io';

import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/article_screen/article_screen.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/screens/collection/collection_screen.dart';
import 'package:acp_app/view/screens/main_screen/main_screen.dart';
import 'package:acp_app/view/screens/settings/settings.dart';
import 'package:acp_app/view/screens/splash_screen/splash_screen.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:acp_app/view/screens/bookmarks/bookmark_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_helper.dart';

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
      await tester
          .pumpAndSettle(const Duration(seconds: 5)); // firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 10));
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
      exit(0);
    });
  });

  group('group name', () {
    testWidgets('Test cases for Login in', (WidgetTester tester) async {
      // Build your widget
      TestHelper.loadApp(flavor!);
      await tester
          .pumpAndSettle(const Duration(seconds: 5)); // firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(MainScreen), findsOneWidget);
      await tester.pump();
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                CustomThemes().gettheme().settings,
      ));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      final signInButton = find.byKey(const ValueKey('signInButton'));

      // Verify that the button is initially present
      expect(signInButton, findsOneWidget);

      // Tap the sign in button
      await tester.tap(signInButton);
      await tester.pumpAndSettle();
      final usernameField = find.byKey(const ValueKey('usernameField'));
      await tester.enterText(usernameField, 'example_username');
      final passwordField = find.byKey(const ValueKey('passwordField'));

      await tester.enterText(passwordField, 'example_password');
      final signInButton1 = find.byKey(const ValueKey('signInButton'));

      expect(signInButton1, findsOneWidget);

      await tester.tap(signInButton);

      // Wait for the animation to complete
      await tester.pumpAndSettle(const Duration(seconds: 10));
    });
  });

  group('2', () {
    testWidgets('Test cases for Bookamrks', (WidgetTester tester) async {
      // Build your widget
      TestHelper.loadApp(flavor!);
      await tester
          .pumpAndSettle(const Duration(seconds: 5)); // firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(MainScreen), findsOneWidget);
      // expect(find., findsAny);
      Finder iconButton =
          find.widgetWithIcon(GestureDetector, Icons.bookmark_add_outlined);
      await tester.tap(iconButton.first);
      await tester.pumpAndSettle(const Duration(seconds: 4));

      // Verify that the icon state is toggled
      await tester.pump();
      await tester.tap(find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                CustomThemes().gettheme().settings,
      ));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
      await tester.tap(find.text(
          'Bookmarks')); // Assuming the BookmarkScreen is the first Text widget in the SettingsPage
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(BookmarkScreen), findsOneWidget);
      // await tester.tap(find.byIcon(Icons.bookmark_add))
      Finder secondIconButton =
          find.widgetWithIcon(GestureDetector, Icons.bookmark_added);
      await tester.tap(secondIconButton);
      await tester.pumpAndSettle(const Duration(seconds: 4));
      expect(find.byType(AppBar), findsOneWidget);
      final gestureDetectorFinder = find.byWidgetPredicate((widget) =>
          widget is GestureDetector &&
          widget.child is Image &&
          (widget.child as Image).image is AssetImage &&
          ((widget.child as Image).image as AssetImage).assetName ==
              CustomThemes().gettheme().leftarrow);

      // Tap the back button if found
      if (gestureDetectorFinder.evaluate().isNotEmpty) {
        await tester.tap(gestureDetectorFinder.first);
        // Wait for animations to complete
        await tester.pumpAndSettle();
      } else {
        fail('Back button not found');
      }
    });
    testWidgets('Tap SettingsPage in MainScreen', (WidgetTester tester) async {
      // Build your widget
      TestHelper.loadApp(flavor!);
      await tester
          .pumpAndSettle(const Duration(seconds: 5)); // firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 10)); // api call

      expect(find.byType(MainScreen), findsOneWidget);
      // expect(find.byIcon(Icons.search), findsOneWidget);
      // await tester.tap(find.byIcon(Icons.search));
      // await tester.pump();
      // Check if the searchAppBar is displayed after tapping the search button
      expect(find.byType(PageView), findsOneWidget);
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
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      expect(find.text('ACP Journal Club'),
          findsOneWidget); //To find ACP Journal Club button
      await tester
          .tap(find.text('ACP Journal Club')); //To tap ACP Journal Club button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.tap(find
          .text('Beyond The Guidelines')); //To tap Beyond The Guidelines button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.tap(
          find.text('Clinical Guidelines')); //To tap Clinical Guidelines button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.tap(find.text('COVID-19')); //To tap COVID-19 button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester
          .tap(find.text('In The Clinic')); //To tap In The Clinic button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.tap(
          find.text('On Being A Doctor')); //To tap On Being A Doctor button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.tap(
          find.text('Original Research')); //To tap Original Research button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.tap(find.text('Reviews')); //To tap Reviews button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      await tester.pump();
    });
  });
}
