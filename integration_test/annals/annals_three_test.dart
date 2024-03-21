import 'package:acp_app/main/flavor_utils/flavors.dart';
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

  group('Login in', () {
    testWidgets('Test cases for Login in', (WidgetTester tester) async {
      // Build your widget
      TestHelper.loadApp(flavor!);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.pumpAndSettle(); // firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 15));
      await tester.pumpAndSettle();
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
}
