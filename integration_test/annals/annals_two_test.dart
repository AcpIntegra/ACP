import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/bookmarks/bookmark_screen.dart';
import 'package:acp_app/view/screens/main_screen/main_screen.dart';
import 'package:acp_app/view/screens/settings/settings.dart';
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
  group('2', () {
    testWidgets('Test cases for Bookamrks', (WidgetTester tester) async {
      // Build your widget
      TestHelper.loadApp(flavor!);
      await tester.pumpAndSettle(const Duration(seconds: 19));
      await tester.pumpAndSettle(); // firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 15));
      await tester.pumpAndSettle();
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
      expect(find.text("No bookmarks found"), findsNothing);
      Finder secondIconButton =
          find.widgetWithIcon(GestureDetector, Icons.bookmark_added).first;
      await tester.tap(secondIconButton);
      await tester.pumpAndSettle(const Duration(seconds: 4));
      expect(find.text("No bookmarks found"), findsOne);
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
  });
}
