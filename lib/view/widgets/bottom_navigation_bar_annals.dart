import 'dart:io';

import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/view_utils/navigation_callback.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/main_screen_index_provider.dart';
import 'package:acp_app/view_model/providers/article_provider.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomNavigationBarAnnals extends ConsumerStatefulWidget {
  const BottomNavigationBarAnnals({super.key});

  @override
  ConsumerState<BottomNavigationBarAnnals> createState() =>
      _BottomNavigationBarAnnalsState();
}

class _BottomNavigationBarAnnalsState
    extends ConsumerState<BottomNavigationBarAnnals> {
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.pinned;

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
    String getPageTitleAnnals(int index) {
      switch (index) {
        case 0:
          return 'Latest Articles ';
        case 1:
          return 'Current Issue ';
        case 2:
          return 'Multimedia ';
        case 3:
          return 'Collection ';
        case 4:
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
          onTap: (index) async {
            NavigatorCallback.popCallback(selectedIndex);
            indexNotifier.changeIndex(index);
            // await ref.read(currentIssueArticlesProvider.notifier).audioPause();
            await ref.watch(allArticlesProvider.notifier).updateArticles();
            SemanticsService.announce(
              "${getPageTitleAnnals(index)} selected",
              TextDirection.ltr,
            );
            await AnalyticsService.userInteractionTrack();
          },
          items: [
            BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? Semantics(
                      label: "Latest Articles Menu selected",
                      excludeSemantics: true,
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().home),
                        color: isDark
                            ? CustomThemes().gettheme().bgColor
                            : CustomThemes().gettheme().whitecolor,
                        size: 90,
                      ),
                    )
                  : Semantics(
                      excludeSemantics: true,
                      label: Platform.isAndroid
                          ? "Latest article menu"
                          : "Latest article menu double tap to activate",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().home),
                        color: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().navigaionBarShadow,
                        size: 90,
                      ),
                    ),
              label: 'Latest Articles',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ? Semantics(
                      label: "Current Issues Menu Selected",
                      excludeSemantics: true,
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().issue),
                        color: isDark
                            ? CustomThemes().gettheme().bgColor
                            : CustomThemes().gettheme().whitecolor,
                        size: 90,
                      ),
                    )
                  : Semantics(
                      excludeSemantics: true,
                      label: Platform.isAndroid
                          ? "Current issue menu"
                          : "Current issue menu double tap to activate",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().issue),
                        color: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().navigaionBarShadow,
                        size: 90,
                      ),
                    ),
              label: 'Issues',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 2
                  ? Semantics(
                      label: "Multimedia Menu Selected",
                      excludeSemantics: true,
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().multimedia),
                        color: isDark
                            ? CustomThemes().gettheme().bgColor
                            : CustomThemes().gettheme().whitecolor,
                        size: 90,
                      ),
                    )
                  : Semantics(
                      excludeSemantics: true,
                      label: Platform.isAndroid
                          ? "Multimedia Menu"
                          : "Multimedia Menu double tap to activate",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().multimedia),
                        color: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().navigaionBarShadow,
                        size: 90,
                      ),
                    ),
              label: 'Multimedia',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 3
                  ? Semantics(
                      label: "Collections Menu Selected",
                      excludeSemantics: true,
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().collections),
                        color: isDark
                            ? CustomThemes().gettheme().bgColor
                            : CustomThemes().gettheme().whitecolor,
                        size: 90,
                      ),
                    )
                  : Semantics(
                      excludeSemantics: true,
                      label: Platform.isAndroid
                          ? "Collection Menu"
                          : "Collection Menu double tap to activate",
                      child: ImageIcon(
                        AssetImage(CustomThemes().gettheme().collections),
                        color: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().navigaionBarShadow,
                        size: 90,
                      ),
                    ),
              label: 'Collections',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 4
                  ? Semantics(
                      label: "Settings Menu Selected",
                      excludeSemantics: true,
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
