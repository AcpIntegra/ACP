import 'package:acp_app/data/network/service/connectivity.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/main/flavor_utils/no_flavour.dart';
import 'package:acp_app/view/screens/main_screen/main_screen.dart';
import 'package:acp_app/view/screens/splash_screen/splash_screen.dart';
import 'package:acp_app/view/view_utils/dynamic_theme.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  (F.appFlavor == null)
      ? runApp(const NoFlavourScreen())
      : await Config().initialize();
}

class MAIN extends StatefulWidget {
  const MAIN({super.key, required this.title, required this.futureCallback});
  final String title;
  final Future Function() futureCallback;
  @override
  State<MAIN> createState() => _MAINState();
}

class _MAINState extends State<MAIN> {
  @override
  void initState() {
    Config().pushNotifications();
    super.initState();
  }

  @override
  void dispose() {
    ConnectivityStatus().controllerDispose();
    super.dispose();
  }

  Future<void> fetch() async {
    await ConnectivityStatus().ensureInitialized();
    if (ConnectivityStatus().isConnected == true) {
      await widget.futureCallback.call();
    }
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return Consumer(builder: (context, ref, child) {
              return MaterialApp(
                  theme: ThemeData(
                      fontFamily: CustomThemes().gettheme().font2,
                      colorScheme: AppTheme.getDarkScheme(),
                      useMaterial3: true),
                  darkTheme: ThemeData(
                      fontFamily: CustomThemes().gettheme().font2,
                      colorScheme: AppTheme.getLightScheme(),
                      useMaterial3: true),
                  themeMode: ref.watch(darkModeProvider)
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  title: widget.title,
                  debugShowCheckedModeBanner: false,
                  home: const MainScreen());
            });
          }
        });
  }
}
