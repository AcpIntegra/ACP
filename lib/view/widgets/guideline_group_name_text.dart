import 'dart:io';
import 'package:acp_app/data/models/guidelines/guidelines_issue.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupNameText extends ConsumerWidget {
  const GroupNameText({super.key, required this.guideline});

  final GuideLinesIssue guideline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    final double activeFont = ref.watch(fontProvider).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 5, 15),
      child: Text(guideline.group,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: isIpad
                  ? (CustomThemes().gettheme().fontsize3 +
                          CustomThemes().gettheme().ipadfontsize) *
                      activeFont
                  : CustomThemes().gettheme().fontsize3 * activeFont,
              color: ref.watch(darkModeProvider)
                  ? CustomThemes().gettheme().whitecolor
                  : CustomThemes().gettheme().bgColor)),
    );
  }
}
