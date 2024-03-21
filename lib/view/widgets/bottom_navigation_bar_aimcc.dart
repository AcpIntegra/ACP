import 'dart:io';

import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/main_screen_index_provider.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomNavigationBarAimcc extends ConsumerStatefulWidget {
  const BottomNavigationBarAimcc({super.key});

  @override
  ConsumerState<BottomNavigationBarAimcc> createState() =>
      _BottomNavigationBarAimccState();
}

class _BottomNavigationBarAimccState
    extends ConsumerState<BottomNavigationBarAimcc> {
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    ),
  );

  SnakeShape snakeShape = SnakeShape.rectangle;

  EdgeInsets padding = const EdgeInsets.all(0);

  Color? selectedColor = CustomThemes().gettheme().bgColor;

  Color? unselectedColor = CustomThemes().gettheme().navigaionBarShadow;

  bool showSelectedLabels = false;

  bool showUnselectedLabels = false;

  @override
  Widget build(BuildContext context) {
    final bool isDark = ref.watch(darkModeProvider);
    final int selectedIndex = ref.watch(indexProvider);
    final IndexNotifier indexNotifier = ref.watch(indexProvider.notifier);
    String getPageTitleAimcc(int index) {
      switch (index) {
        case 0:
          return 'Inprogress ';
        case 1:
          return 'Archives ';
        case 2:
          return 'Settings ';
        default:
          return '';
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? CustomThemes().gettheme().blacksshadow1
            : CustomThemes().gettheme().whitecolor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: isDark
                      ? CustomThemes().gettheme().darkmodegrey
                      : CustomThemes().gettheme().greybackground,
                  spreadRadius: 0.2,
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                ),
              ],
      ),
      child: ClipRRect(
        child: SnakeNavigationBar.color(
          backgroundColor:
              isDark ? CustomThemes().gettheme().darkmodegrey : null,
          behaviour: snakeBarStyle,
          snakeShape: snakeShape,
          shape: bottomBarShape,
          padding: padding,
          shadowColor: CustomThemes().gettheme().black.withOpacity(0.0),
          snakeViewColor:
              isDark ? CustomThemes().gettheme().whitecolor : selectedColor,
          unselectedItemColor: unselectedColor,
          showUnselectedLabels: showUnselectedLabels,
          showSelectedLabels: showSelectedLabels,
          currentIndex: selectedIndex,
          onTap: (index) {
            const Duration delay = Duration(seconds: 1);
            Future.delayed(delay, () {
              SemanticsService.announce(
                "${getPageTitleAimcc(index)} selected",
                TextDirection.ltr,
              );
            });
            indexNotifier.changeIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? Semantics(
                      excludeSemantics: true,
                      label: "In Progress menu Selected",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().article),
                        color: isDark
                            ? CustomThemes().gettheme().bgColor
                            : CustomThemes().gettheme().whitecolor,
                        size: 90,
                      ),
                    )
                  : Semantics(
                      excludeSemantics: true,
                      label: Platform.isAndroid
                          ? "In progress Menu"
                          : "In progress Menu double tap to activate",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().article),
                        color: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().navigaionBarShadow,
                        size: 90,
                      ),
                    ),
              label: 'In Progress',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ? Semantics(
                      excludeSemantics: true,
                      label: "Archive menu Selected",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().archives),
                        color: isDark
                            ? CustomThemes().gettheme().bgColor
                            : CustomThemes().gettheme().whitecolor,
                        size: 90,
                      ),
                    )
                  : Semantics(
                      excludeSemantics: true,
                      label: Platform.isAndroid
                          ? "Archive Menu"
                          : "Archive Menu double tap to activate",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().archives),
                        color: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().navigaionBarShadow,
                        size: 90,
                      ),
                    ),
              label: 'Archive',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 2
                  ? Semantics(
                      excludeSemantics: true,
                      label: "Settings menu Selected",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().settings),
                        color: isDark
                            ? CustomThemes().gettheme().bgColor
                            : CustomThemes().gettheme().whitecolor,
                        size: 90,
                      ),
                    )
                  : Semantics(
                      excludeSemantics: true,
                      label: Platform.isAndroid
                          ? "Settings Menu"
                          : "Settings Menu double tap to activate",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().settings),
                        color: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().navigaionBarShadow,
                        size: 90,
                      ),
                    ),
              label: 'Settings',
            ),
          ],
          selectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
