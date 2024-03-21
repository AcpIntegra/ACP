import 'dart:io';

import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/material.dart';

class NonBottomNavigationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NonBottomNavigationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return AppBar(
      backgroundColor: CustomThemes().gettheme().bgColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: FocusScope(
                child: Semantics(
                  label: 'Back button Double tap to activate',
                  excludeSemantics: true,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pop(context);
                      await AnalyticsService.userInteractionTrack();
                    },
                    child: Image.asset(
                      CustomThemes().gettheme().leftarrow.toString(),
                      width: 24.0,
                      height: 24.0,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              )),
          FocusScope(
              child: Semantics(
            label: 'Bookmarks Heading',
            excludeSemantics: true,
            child: Text(
              "Bookmarks",
              style: TextStyle(
                color: CustomThemes().gettheme().whitecolor,
                fontFamily: CustomThemes().gettheme().font1,
                fontSize:
                    isIpad ? 23 + CustomThemes().gettheme().ipadfontsize : 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
