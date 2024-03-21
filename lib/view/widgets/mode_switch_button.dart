import 'dart:io';

import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeSwitchButton extends ConsumerWidget {
  final String buttonText;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  const ModeSwitchButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    final activeFont = ref.watch(fontProvider).size;
    bool isDarktheme = ref.watch(darkModeProvider);
    return SizedBox(
      width: F.appFlavor == Flavor.guidelines ? null : 185,
      height: F.appFlavor == Flavor.guidelines ? null : 50,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarktheme
              ? (isActive
                  ? CustomThemes().gettheme().whitecolor
                  : CustomThemes().gettheme().transparent)
              : (isActive
                  ? CustomThemes().gettheme().bgColor
                  : CustomThemes().gettheme().whitecolor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48.0),
          ),
        ).copyWith(
          side: MaterialStateProperty.all(BorderSide(
            color: isDarktheme
                ? isActive
                    ? CustomThemes().gettheme().darkmodeblack
                    : CustomThemes().gettheme().whitecolor
                : isActive
                    ? CustomThemes().gettheme().whitecolor
                    : CustomThemes().gettheme().bgColor,
            width: 1.0,
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: (F.appFlavor == Flavor.guidelines)
              ? MainAxisSize.min
              : MainAxisSize.max, // by default it is max,
          children: [
            Icon(icon,
                color: isDarktheme
                    ? isActive
                        ? CustomThemes().gettheme().darkmodeblack
                        : CustomThemes().gettheme().whitecolor
                    : isActive
                        ? CustomThemes().gettheme().whitecolor
                        : CustomThemes().gettheme().bgColor),
            SizedBox(
              height: F.appFlavor == Flavor.guidelines ? null : double.infinity,
              width: F.appFlavor == Flavor.guidelines ? null : 10,
            ),
            Text(
              buttonText,
              style: TextStyle(
                  fontSize: (F.appFlavor == Flavor.guidelines)
                      ? isIpad
                          ? (CustomThemes().gettheme().fontsize3 +
                                  CustomThemes().gettheme().ipadfontsize) *
                              activeFont
                          : 14 * activeFont
                      : isIpad
                          ? (CustomThemes().gettheme().fontsize3 +
                                  CustomThemes().gettheme().ipadfontsize) *
                              activeFont
                          : CustomThemes().gettheme().fontsize3 * activeFont,
                  color: isDarktheme
                      ? isActive
                          ? CustomThemes().gettheme().darkmodeblack
                          : CustomThemes().gettheme().whitecolor
                      : isActive
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().bgColor),
            ),
          ],
        ),
      ),
    );
  }
}
