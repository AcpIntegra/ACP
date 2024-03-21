import 'dart:developer';

import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_aimcc.dart';
import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_annals.dart';
import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/utils/constants/guideline_table_columns.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view/widgets/guidelines_widgets/guideline_bottom_sheet.dart';
import 'package:flutter/material.dart';

class NavigatorCallback {
  static void popCallback(int index) {
    switch (F.appFlavor) {
      case Flavor.annals:
        _annalsPopCallback(index);
      case Flavor.aimcc:
        _aimccPopCallback(index);
      case Flavor.guidelines:
        _guidelinesPopCallback(index);
      default:
    }
  }

  static Future<void> showGuidelineBox(
      BuildContext context, bool isDark, double activeFont) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDark
                  ? CustomThemes().gettheme().darkmodegrey
                  : CustomThemes().gettheme().whitecolor),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              FocusScope(
                  child: Semantics(
                label: 'Sunset Policy For ACP Guidelines',
                excludeSemantics: true,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Sunset Policy For ACP Guidelines",
                      style: TextStyle(
                          color: isDark
                              ? CustomThemes().gettheme().whitecolor
                              : CustomThemes().gettheme().bgColor,
                          fontSize: 16 * activeFont,
                          fontWeight:
                              isDark ? FontWeight.w800 : FontWeight.w800)),
                ),
              )),
              FocusScope(
                  child: Semantics(
                      label:
                          "All ACP clinical practice guidelines and clinical guidelines statements are considered automatically withdrawn or invalid 5 years after publication or once an upadte has been issued.",
                      excludeSemantics: true,
                      child: Text(
                        "All ACP clinical practice guidelines and clinical guidelines statements are considered automatically withdrawn or invalid 5 years after publication or once an upadte has been issued.",
                        style: TextStyle(fontSize: 14 * activeFont),
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FilledButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith((states) =>
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => isDark
                                ? CustomThemes().gettheme().whitecolor
                                : CustomThemes().gettheme().bgColor)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text("OK",
                          style: TextStyle(fontSize: 14 * activeFont)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  static void _annalsPopCallback(int index) {
    switch (index) {
      case 0:
        final currentState = MainPagesAnnals().articlePage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      case 1:
        final currentState = MainPagesAnnals().issuePage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      case 2:
        final currentState =
            MainPagesAnnals().collectionPage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      case 3:
        final currentState =
            MainPagesAnnals().collectionPage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      case 4:
        final currentState =
            MainPagesAnnals().settingsPage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      default:
    }
  }

  static void _aimccPopCallback(int index) {
    switch (index) {
      case 0:
        final currentState =
            MainPagesAimcc().inProgressPage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      case 1:
        final currentState = MainPagesAimcc().archivesPage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      case 2:
        final currentState = MainPagesAimcc().bookMarkPage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      case 4:
        final currentState = MainPagesAimcc().settingsPage.pageKey.currentState;
        if (currentState != null) {
          currentState.popUntil((route) => route.isFirst);
        }
      default:
    }
  }

  static Future<void> showDialogBox(
      {required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        elevation: 0,
        enableDrag: true,
        context: context,
        builder: (context) => GuidelineBottomSheet(child: child));
  }

  static void _guidelinesPopCallback(int index) {}

  static Future<void> articleWebViewPopBackHandler(
      {required GlobalObjectKey<ArticleWebViewState> key,
      required GlobalKey<NavigatorState> naviagtorKey}) async {
    final ArticleWebViewState? state = key.currentState;
    if (state != null && state.context.mounted && state.mounted) {
      if (await state.webViewController.canGoBack()) {
        state.webViewController.goBack();
      } else {
        naviagtorKey.currentState!.pop();
      }
    } else {
      naviagtorKey.currentState!.pop();
    }
  }

  static Future<void> guidelineWebViewPopBackHandler(
      {required GlobalObjectKey<GuidelineWebViewState> key,
      required GlobalKey<NavigatorState> naviagtorKey}) async {
    final GuidelineWebViewState? state = key.currentState;
    if (state != null && state.mounted && state.context.mounted) {
      if (state.stack.isNotEmpty) {
        state.animationController.removeListener(state.animationCallback);
        state.animationController
            .animateTo(state.stack.last, duration: animateToDuration);
        state.stack.removeLast();
        await Future.delayed(
            const Duration(milliseconds: 250),
            () =>
                state.animationController.addListener(state.animationCallback));
        log("pop => ${state.stack.toString()}");
      } else {
        naviagtorKey.currentState!.pop();
      }
    }
  }
}
