import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/main_screen/main_screen.dart';
import 'package:acp_app/view/screens/splash_screen/splash_screen.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_helper.dart';

void main() {
  Flavor? flavor;
  setUpAll(() {
    flavor = Flavor.aimcc;
  });
  group('Aimcc', () {
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

      Finder iconButton =
          find.widgetWithIcon(GestureDetector, Icons.bookmark_add_outlined);
      await tester.tap(iconButton.first);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().archives)); //to tap archives

      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().aimccbookmark)); //to tap bookmark
      await tester.pumpAndSettle(const Duration(seconds: 3));
      // Finder iconsButton =
      //     find.widgetWithIcon(GestureDetector, Icons.bookmark_added);
      // await tester.tap(iconsButton.first);
      // await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().article)); //to tap article
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().settings));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text('Small'), findsOneWidget); //To find Small Button
      expect(find.text('Medium'), findsOneWidget); //To find Medium Button
      expect(find.text('Large'), findsOneWidget); //To find Large Button
      await tester.tap(find.text('Small'));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.text('Medium')); //To tap Large Button
      //To tap Small Button
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().article)); //to tap article
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().settings)); //to tap settings
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.text('Large'));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().article)); //to tap article
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().settings)); //to tap settings
      await tester.pumpAndSettle(
          const Duration(seconds: 3)); // to wait in the page for 5 seconds
      expect(find.text('Appearance'), findsOneWidget); //To find Appearance text
      expect(find.text('Light'), findsOneWidget); //To find Light button
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.text('Light')); //To tap Light button
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().article)); //to tap article
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().settings)); //to tap settings
      await tester.pumpAndSettle(const Duration(
          seconds:
              3)); // to wait in the page for 5 seconds     // to wait in the page for 5 seconds
      expect(find.text('Dark'), findsOneWidget); //To find Dark button
      await tester.tap(find.text('Dark'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().article));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              CustomThemes().gettheme().settings)); //to tap settings
      await tester.pumpAndSettle(
          const Duration(seconds: 3)); // to wait in the page for 3 seconds
      await tester.pump();
    });
  });
}
