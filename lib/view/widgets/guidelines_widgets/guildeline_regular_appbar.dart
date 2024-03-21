import 'dart:io';

import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidelineRegularAppbar extends ConsumerWidget
    implements PreferredSizeWidget {
  const GuidelineRegularAppbar({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double activeFont = ref.watch(fontProvider).size;
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return AppBar(
      backgroundColor: CustomThemes().gettheme().bgColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: FocusScope(
              child: Semantics(
            label: 'A C P',
            excludeSemantics: true,
            child: Image(
              image: AssetImage(CustomThemes().gettheme().acpicon.toString()),
              height: 20,
              width: 52,
            ),
          ))),
      title: FocusScope(
          child: Semantics(
        label: 'Clinical Guidelines',
        excludeSemantics: true,
        child: Text(
          'Clinical Guidelines',
          style: TextStyle(
              color: CustomThemes().gettheme().whitecolor,
              fontSize: isIpad
                  ? (CustomThemes().gettheme().fontsize3 +
                          CustomThemes().gettheme().ipadfontsize) *
                      activeFont
                  : CustomThemes().gettheme().fontsize3,
              fontWeight: FontWeight.w600),
        ),
      )),
      actions: [
        Semantics(
          label: "Settings double tap to activate",
          excludeSemantics: true,
          child: IconButton(
            icon: const Icon(Icons.settings),
            color: CustomThemes().gettheme().whitecolor,
            iconSize: 26,
            onPressed: () async {
              if (onPressed != null) {
                onPressed?.call();
              }
              await AnalyticsService.userInteractionTrack();
            },
          ),
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
