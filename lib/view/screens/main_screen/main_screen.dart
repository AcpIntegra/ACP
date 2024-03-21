import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/screens/guidline_screen/main_screen_guidelines.dart';
import 'package:acp_app/view/screens/main_screen/get_screen_aimcc.dart';
import 'package:acp_app/view/screens/main_screen/get_screen_annals.dart';
import 'package:acp_app/view/widgets/bottom_navigation_bar_aimcc.dart';
import 'package:acp_app/view/widgets/bottom_navigation_bar_annals.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            body: switch (F.appFlavor) {
              Flavor.annals => const GetScreenAnnals(),
              Flavor.aimcc => const GetScreenAimcc(),
              Flavor.guidelines => const GuidelinesMainScreen(),
              null => null
            },
            bottomNavigationBar: switch (F.appFlavor) {
              Flavor.annals => const BottomNavigationBarAnnals(),
              Flavor.aimcc => const BottomNavigationBarAimcc(),
              Flavor.guidelines => null,
              null => null
            }));
  }
}
