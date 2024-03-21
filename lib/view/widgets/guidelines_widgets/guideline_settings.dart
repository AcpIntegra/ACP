import 'dart:io';

import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view/widgets/font_selector_widget.dart';
import 'package:acp_app/view/widgets/mode_switch_button.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GuidelineSettings extends ConsumerWidget {
  const GuidelineSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontResponse = ref.watch(fontProvider);
    final activeFont = fontResponse.size;
    final isDark = ref.watch(darkModeProvider);
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Focus(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Focus(
              autofocus: true,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Semantics(
                  excludeSemantics: true,
                  label: 'Text Size heading',
                  child: Text(
                    'Text Size',
                    style: TextStyle(
                      color: isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().blacksshadow1,
                      fontSize: isIpad
                          ? (CustomThemes().gettheme().fontsize2 +
                                  CustomThemes().gettheme().ipadfontsize) *
                              activeFont
                          : CustomThemes().gettheme().fontsize2 * activeFont,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )),
          const FontSelectorWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Semantics(
                  excludeSemantics: true,
                  label: 'Appearance heading',
                  child: Text(
                    'Appearance',
                    style: TextStyle(
                      color: isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().blacksshadow1,
                      fontSize: isIpad
                          ? (CustomThemes().gettheme().fontsize2 +
                                  CustomThemes().gettheme().ipadfontsize) *
                              activeFont
                          : CustomThemes().gettheme().fontsize2 * activeFont,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Flexible(
                    child: FocusScope(
                        child: Semantics(
                  excludeSemantics: true,
                  label: isDark
                      ? "Light Mode  Double tap to activate"
                      : "Light Mode  is on",
                  child: ModeSwitchButton(
                      buttonText: 'Light',
                      icon: Icons.wb_sunny,
                      isActive: !ref.watch(darkModeProvider),
                      onPressed: () async {
                        Fluttertoast.showToast(
                            msg: "Light Mode  is on",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 0,
                            backgroundColor:
                                const Color.fromARGB(255, 237, 236, 236),
                            textColor: const Color.fromARGB(255, 9, 8, 8),
                            fontSize: 16.0);
                        ref.watch(darkModeProvider.notifier).setLight();
                      }),
                ))),
                Flexible(
                    child: FocusScope(
                        child: Semantics(
                  excludeSemantics: true,
                  label: isDark
                      ? "Dark Mode  is on"
                      : "Dark Mode  Double tap to activate",
                  child: ModeSwitchButton(
                    buttonText: 'Dark',
                    icon: Icons.nightlight,
                    isActive: ref.watch(darkModeProvider),
                    onPressed: () async {
                      Fluttertoast.showToast(
                          msg: "Dark Mode  is on",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 0,
                          backgroundColor:
                              const Color.fromARGB(255, 237, 236, 236),
                          textColor: const Color.fromARGB(255, 9, 8, 8),
                          fontSize: 16.0);
                      ref.watch(darkModeProvider.notifier).setDark();
                    },
                  ),
                )))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
