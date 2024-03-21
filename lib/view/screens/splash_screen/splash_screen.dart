import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        child: Container(
      color: F.appFlavor == Flavor.guidelines
          ? CustomThemes().gettheme().whitecolor
          : CustomThemes().gettheme().bgColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            F.appFlavor == Flavor.annals
                ? Image.asset(CustomThemes().gettheme().acpicon, height: 30)
                : const SizedBox(),
            Padding(
              padding: F.appFlavor == Flavor.aimcc
                  ? const EdgeInsets.fromLTRB(23, 10, 10, 23)
                  : F.appFlavor == Flavor.guidelines
                      ? EdgeInsets.zero
                      : const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: F.appFlavor == Flavor.guidelines
                  ? Image.asset(
                      CustomThemes().gettheme().logo,
                      height: 120,
                      width: 150,
                    )
                  : Image.asset(
                      CustomThemes().gettheme().logo,
                      height: 120,
                    ),
            ),
            Padding(
              padding: F.appFlavor == Flavor.guidelines
                  ? EdgeInsets.zero
                  : const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: F.appFlavor == Flavor.guidelines
                  ? Image.asset(
                      CustomThemes().gettheme().acpLogo2,
                      height: 120,
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    ));
  }
}
