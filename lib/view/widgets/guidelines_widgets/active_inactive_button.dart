import 'dart:io';

import 'package:acp_app/view/view_utils/navigation_callback.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:acp_app/view_model/providers/guideline_provider/guidelines_article_provider.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActiveInactiveButton extends ConsumerWidget {
  const ActiveInactiveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isActive = ref.watch(guidelineSelectedIndexProvider);
    bool isDark = ref.watch(darkModeProvider);
    return CustomSlidingSegmentedControl<int>(
      initialValue: 1,
      children: {
        1: Platform.isAndroid
            ? FocusScope(
                child: Semantics(
                label: !isActive
                    ? 'Active articles selected'
                    : 'Active articles double tap to activate',
                excludeSemantics: true,
                child: Text('Active',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: !isActive
                            ? isDark
                                ? CustomThemes().gettheme().bgColor
                                : CustomThemes().gettheme().whitecolor
                            : isDark
                                ? CustomThemes().gettheme().black
                                : CustomThemes().gettheme().bgColor)),
              ))
            : FocusScope(
                child: Semantics(
                  label: !isActive
                      ? 'Active articles selected'
                      : 'Active articles double tap to activate',
                  excludeSemantics: true,
                  child: Text('Active',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: !isActive
                              ? isDark
                                  ? CustomThemes().gettheme().bgColor
                                  : CustomThemes().gettheme().whitecolor
                              : isDark
                                  ? const Color(0xFF1b1b1b)
                                  : CustomThemes().gettheme().bgColor)),
                ),
              ),
        2: Platform.isAndroid
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FocusScope(
                      child: Semantics(
                          label: isActive
                              ? 'Inactive articles selected'
                              : 'Inactive articles double tap to activate',
                          excludeSemantics: true,
                          child: Text('Inactive',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: isActive
                                      ? isDark
                                          ? CustomThemes().gettheme().bgColor
                                          : CustomThemes().gettheme().whitecolor
                                      : isDark
                                          ? CustomThemes().gettheme().black
                                          : CustomThemes()
                                              .gettheme()
                                              .bgColor)))),
                  FocusScope(
                      child: Semantics(
                          label: 'Info  icon double tap to activate',
                          excludeSemantics: true,
                          child: IconButton(
                            onPressed: () {
                              NavigatorCallback.showGuidelineBox(context,
                                  isDark, ref.watch(fontProvider).size);
                            },
                            icon: const Icon(Icons.info_outline_rounded),
                            color: isActive
                                ? isDark
                                    ? CustomThemes().gettheme().bgColor
                                    : CustomThemes().gettheme().whitecolor
                                : isDark
                                    ? CustomThemes().gettheme().black
                                    : CustomThemes().gettheme().bgColor,
                          )))
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FocusScope(
                      child: Semantics(
                          label: isActive
                              ? 'Inactive articles selected'
                              : 'Inactive articles double tap to activate',
                          excludeSemantics: true,
                          child: Text('Inactive',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: isActive
                                      ? isDark
                                          ? CustomThemes().gettheme().bgColor
                                          : CustomThemes().gettheme().whitecolor
                                      : isDark
                                          ? CustomThemes().gettheme().black
                                          : CustomThemes()
                                              .gettheme()
                                              .bgColor)))),
                  FocusScope(
                      child: Semantics(
                          label: 'Info  icon double tap to activate',
                          excludeSemantics: true,
                          child: IconButton(
                            onPressed: () {
                              NavigatorCallback.showGuidelineBox(context,
                                  isDark, ref.watch(fontProvider).size);
                            },
                            icon: const Icon(Icons.info_outline_rounded),
                            color: isActive
                                ? isDark
                                    ? CustomThemes().gettheme().bgColor
                                    : CustomThemes().gettheme().whitecolor
                                : isDark
                                    ? CustomThemes().gettheme().black
                                    : CustomThemes().gettheme().bgColor,
                          ))),
                ],
              ),
        // )
      },
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF949494)
            : CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.circular(20),
      ),
      thumbDecoration: BoxDecoration(
        color: isDark
            ? CustomThemes().gettheme().whitecolor
            : CustomThemes().gettheme().bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      fixedWidth: responsiveWidth(175, context),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInToLinear,
      onValueChanged: (v) {
        if (v == 1) {
          ref.watch(guidelinesIssueProvider.notifier).changeArticle(false);
        } else if (v == 2) {
          ref.watch(guidelinesIssueProvider.notifier).changeArticle(true);
        }
        ref.watch(guidelineSelectedIndexProvider.notifier).change(v == 2);
      },
    );
  }

  double responsiveWidth(double width, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Assuming a design width of 375 as a reference point
    double designWidth = 375.0;
    return (width / designWidth) * screenWidth;
  }
}
