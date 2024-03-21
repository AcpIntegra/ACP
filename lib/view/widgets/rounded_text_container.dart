import 'dart:io';

import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';

class RoundedTextContainer extends ConsumerWidget {
  const RoundedTextContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    double activeFont = ref.watch(fontProvider).size;
    final isDark = ref.watch(darkModeProvider);
    Widget textWidget = Text(
      text,
      style: TextStyle(
        color: isDark
            ? CustomThemes().gettheme().whitecolor
            : CustomThemes().gettheme().bgColor, // Text color
        fontSize: isIpad
            ? 10.0 * activeFont + CustomThemes().gettheme().ipadfontsize
            : 10.0 * activeFont,
        fontWeight: F.appFlavor == Flavor.guidelines
            ? FontWeight.w500
            : FontWeight.bold,
        fontFamily: (F.appFlavor == Flavor.guidelines)
            ? null
            : CustomThemes().gettheme().font1,
      ),
    );
    return Container(
      padding: EdgeInsets.all(F.appFlavor == Flavor.guidelines ? 2.0 : 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            F.appFlavor == Flavor.guidelines ? 10.0 : 14), // Rounded corners
        border: Border.all(
          color: isDark
              ? CustomThemes().gettheme().whitecolor
              : CustomThemes().gettheme().bgColor, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: (F.appFlavor == Flavor.guidelines)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: textWidget,
            )
          : textWidget,
    );
  }
}
