import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view/widgets/icon_preview_item.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FontSelectorWidget extends ConsumerWidget {
  const FontSelectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontResponse = ref.watch(fontProvider);
    final activeFont = fontResponse.size;
    final activeFontName = fontResponse.title;
    final isDark = ref.watch(darkModeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Semantics(
          label: activeFontName == 'Small'
              ? 'Small Font Size selected'
              : 'Small Font Size button Double tap to activate',
          excludeSemantics: true,
          child: Column(
            children: [
              IconPreviewItem(
                iconPath: isDark
                    ? activeFontName == 'Small'
                        ? CustomThemes().gettheme().smalldarkselected
                        : CustomThemes().gettheme().smallfontdark
                    : activeFontName == 'Small'
                        ? CustomThemes().gettheme().smallselected
                        : CustomThemes().gettheme().smallfont,
                isSelected: activeFontName == 'Small',
                isDark: isDark,
                onImageTap: () {
                  ref
                      .watch(fontProvider.notifier)
                      .updateFonts('Small', TableNames.fontsize);
                  SemanticsService.announce(
                    "Small Font Size selected",
                    TextDirection.ltr,
                  );
                },
              ),
              Text(
                'Small',
                style: TextStyle(
                  color: activeFontName == 'Small'
                      ? isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().bgColor
                      : isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().black,
                  fontSize: 12 * activeFont,
                  fontFamily: CustomThemes().gettheme().font2,
                  fontWeight: activeFontName == 'Medium'
                      ? isDark
                          ? FontWeight.w800
                          : FontWeight.w400
                      : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Semantics(
          label: activeFontName == 'Medium'
              ? 'Medium Font Size selected'
              : 'Medium Font Size  Double tap to activate',
          excludeSemantics: true,
          child: Column(
            children: [
              IconPreviewItem(
                iconPath: isDark
                    ? activeFontName == 'Medium'
                        ? CustomThemes().gettheme().mediumdarkselected
                        : CustomThemes().gettheme().mediumfontdark
                    : activeFontName == 'Medium'
                        ? CustomThemes().gettheme().mediumselected
                        : CustomThemes().gettheme().mediumfont,
                isSelected: activeFontName == 'Medium',
                isDark: isDark,
                onImageTap: () {
                  ref
                      .watch(fontProvider.notifier)
                      .updateFonts('Medium', TableNames.fontsize);
                  SemanticsService.announce(
                    "Medium Font Size selected",
                    TextDirection.ltr,
                  );
                },
              ),
              Text(
                'Medium',
                style: TextStyle(
                  color: activeFontName == 'Medium'
                      ? isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().bgColor
                      : isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().black,
                  fontSize: 12 * activeFont,
                  fontFamily: CustomThemes().gettheme().font2,
                  fontWeight: activeFontName == 'Medium'
                      ? isDark
                          ? FontWeight.w800
                          : FontWeight.w400
                      : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Semantics(
          label: activeFontName == 'Large'
              ? 'Large Font Size selected'
              : 'Large Font Size  Double tap to activate',
          excludeSemantics: true,
          child: Column(
            children: [
              IconPreviewItem(
                iconPath: isDark
                    ? activeFontName == 'Large'
                        ? CustomThemes().gettheme().largedarkselected
                        : CustomThemes().gettheme().largefontdark
                    : activeFontName == 'Large'
                        ? CustomThemes().gettheme().largeselected
                        : CustomThemes().gettheme().largefont,
                isSelected: activeFontName == 'Large',
                isDark: isDark,
                onImageTap: () {
                  ref
                      .watch(fontProvider.notifier)
                      .updateFonts('Large', TableNames.fontsize);
                  SemanticsService.announce(
                    "Large Font Size selected",
                    TextDirection.ltr,
                  );
                },
              ),
              Text(
                'Large',
                style: TextStyle(
                  color: activeFontName == 'Large'
                      ? isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().bgColor
                      : isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().black,
                  fontSize: 12 * activeFont,
                  fontFamily: CustomThemes().gettheme().font2,
                  fontWeight: activeFontName == 'Medium'
                      ? isDark
                          ? FontWeight.w800
                          : FontWeight.w400
                      : FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
