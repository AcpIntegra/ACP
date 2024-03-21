import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/guidline_screen/main_screen_guidelines.dart';
import 'package:acp_app/view/screens/splash_screen/splash_screen.dart';
import 'package:acp_app/view/widgets/guidelines_widgets/guideline_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper/test_helper.dart';

void main() {
  Flavor? flavor;
  setUpAll(() {
    flavor = Flavor.guidelines;
  });

  group('Guideline Test', () {
    testWidgets('Guideline settings test', (tester) async {
      TestHelper.loadApp(flavor!);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      await tester.pumpAndSettle(); //// firebase messaging.
      expect(find.byType(SplashScreen), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 15));
      await tester.pumpAndSettle(); // api call
      expect(find.byType(GuidelinesMainScreen), findsOneWidget);
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(GuidelineBottomSheet), findsOneWidget);
      expect(find.text('Text Size'), findsOneWidget);
      expect(find.text('Small'), findsOneWidget); //To find Small Button
      expect(find.text('Medium'), findsOneWidget); //To find Medium Button
      expect(find.text('Large'), findsOneWidget);
      await tester.tap(find.text('Small')); //To tap Small Button
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await tester.pumpAndSettle(); // to wait in the page for 5 seconds
      await tester.tap(find.text('Large'));
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await tester.pumpAndSettle(); //To tap Large Button
      expect(find.text('Appearance'), findsOneWidget); //To find Appearance text
      expect(find.text('Light'), findsOneWidget); //To find Light button
      await tester.tap(find.text('Light')); //To tap Light button
      await tester.pumpAndSettle(
          const Duration(seconds: 5)); // to wait in the page for 5 seconds
      expect(find.text('Dark'), findsOneWidget); //To find Dark button
      await tester.tap(find.text('Dark')); //To tap Dark button
      await tester.pumpAndSettle(const Duration(seconds: 5));
    });
  });
}
