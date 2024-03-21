import 'dart:io';

import 'package:acp_app/main/config.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/notifiers/darkmode_notifier.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:acp_app/view/widgets/secondary_appbar.dart';
import 'package:acp_app/view/screens/bookmarks/bookmark_screen.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:acp_app/view/screens/login_screen/login_page.dart';
import 'package:acp_app/view_model/providers/auth_provider/login_provider.dart';

import '../../widgets/icon_preview_item.dart';
import '../../widgets/mode_switch_button.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isSelected = true;
  late String activeFontName = '';
  late double activeFont = 0;

  void showModeSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ref.watch(fontProvider.notifier).loadDefaultFonts();
    final bool isDark = ref.watch(darkModeProvider);
    activeFont = ref.watch(fontProvider).size;
    activeFontName = ref.watch(fontProvider).title;
    final isSignIn = ref.watch(loginProvider).accessToken;
    final username = ref.watch(loginProvider).username;
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Semantics(
        label: 'Settings Screen', // Provide a meaningful label for the screen
        child: Scaffold(
          appBar: const SecondaryAppBar(title: "Settings"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  (CustomThemes().projectname == 'annals')
                      ? Column(
                          children: [
                            isSignIn != ''
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16),
                                      Flexible(
                                        child: Text(
                                          'Signed in as $username',
                                          style: TextStyle(
                                            color: isDark
                                                ? CustomThemes()
                                                    .gettheme()
                                                    .whitecolor
                                                : CustomThemes()
                                                    .gettheme()
                                                    .black,
                                            fontSize: isIpad
                                                ? (CustomThemes()
                                                            .gettheme()
                                                            .fontsize4 +
                                                        CustomThemes()
                                                            .gettheme()
                                                            .ipadfontsize) *
                                                    activeFont
                                                : CustomThemes()
                                                        .gettheme()
                                                        .fontsize4 *
                                                    activeFont,
                                            fontFamily:
                                                CustomThemes().gettheme().font2,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(height: 16),
                            Semantics(
                              excludeSemantics: true,
                              label: isSignIn == ''
                                  ? 'Sign in Button double tap to activate'
                                  : 'Sign out Button double tap to activate',
                              child: Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    key: const ValueKey('signInButton'),
                                    onPressed: () async {
                                      if (isSignIn == '') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()),
                                        );
                                      } else {
                                        ref
                                            .watch(loginProvider.notifier)
                                            .getSignedOut();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Successfully Signed Out'),
                                          ),
                                        );
                                      }
                                      await AnalyticsService
                                          .userInteractionTrack();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isDark
                                          ? CustomThemes().gettheme().whitecolor
                                          : CustomThemes().gettheme().bgColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      fixedSize: const Size(200, 55),
                                    ),
                                    child: Text(
                                      isSignIn == '' ? 'Sign In' : 'Sign Out',
                                      style: TextStyle(
                                        color: isDark
                                            ? CustomThemes().gettheme().bgColor
                                            : CustomThemes()
                                                .gettheme()
                                                .whitecolor,
                                        fontSize: isIpad
                                            ? (CustomThemes()
                                                        .gettheme()
                                                        .fontsize3 +
                                                    CustomThemes()
                                                        .gettheme()
                                                        .ipadfontsize) *
                                                activeFont
                                            : CustomThemes()
                                                    .gettheme()
                                                    .fontsize3 *
                                                activeFont,
                                        fontFamily:
                                            CustomThemes().gettheme().font2,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                              width: double.infinity,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 12,
                              width: double.infinity,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  (CustomThemes().projectname == 'annals')
                      ? Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.bookmark_add),
                                const SizedBox(
                                  width: 16,
                                ),
                                FocusScope(
                                  child: Semantics(
                                    excludeSemantics: true,
                                    label:
                                        'Bookmarks button Double tap to activate ',
                                    child: GestureDetector(
                                      onTap: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BookmarkScreen()));
                                        await AnalyticsService
                                            .userInteractionTrack();
                                      },
                                      child: Text(
                                        'Bookmarks',
                                        style: TextStyle(
                                          color: isDark
                                              ? CustomThemes()
                                                  .gettheme()
                                                  .whitecolor
                                              : CustomThemes().gettheme().black,
                                          fontSize: isIpad
                                              ? (CustomThemes()
                                                          .gettheme()
                                                          .fontsize5 +
                                                      CustomThemes()
                                                          .gettheme()
                                                          .ipadfontsize) *
                                                  activeFont
                                              : CustomThemes()
                                                      .gettheme()
                                                      .fontsize5 *
                                                  activeFont,
                                          fontFamily:
                                              CustomThemes().gettheme().font2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                              width: double.infinity,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 12,
                              width: double.infinity,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  Row(
                    children: [
                      Semantics(
                        label: 'Text size heading',
                        excludeSemantics: true,
                        child: Text(
                          'Text Size',
                          style: TextStyle(
                            color: isDark
                                ? CustomThemes().gettheme().whitecolor
                                : CustomThemes().gettheme().black,
                            fontSize: isIpad
                                ? (CustomThemes().gettheme().fontsize5 +
                                        CustomThemes()
                                            .gettheme()
                                            .ipadfontsize) *
                                    activeFont
                                : CustomThemes().gettheme().fontsize5 *
                                    activeFont,
                            fontFamily: CustomThemes().gettheme().font1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                    width: double.infinity,
                  ),
                  FractionallySizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await AnalyticsService.userInteractionTrack();
                            ref
                                .watch(fontProvider.notifier)
                                .updateFonts('Small', TableNames.fontsize);
                            SemanticsService.announce(
                              "Small font selected",
                              TextDirection.ltr,
                            );
                          },
                          child: Column(
                            children: [
                              Platform.isIOS
                                  ? Semantics(
                                      label: activeFontName == 'Small'
                                          ? 'Small Font Size selected'
                                          : 'Small Font Size button Double tap to activate',
                                      excludeSemantics: true,
                                      child: Column(
                                        children: [
                                          IconPreviewItem(
                                            iconPath: isDark
                                                ? activeFontName == 'Small'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .smalldarkselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .smallfontdark
                                                : activeFontName == 'Small'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .smallselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .smallfont,
                                            isSelected:
                                                activeFontName == 'Small',
                                            isDark: isDark,
                                            onImageTap: () {
                                              ref
                                                  .watch(fontProvider.notifier)
                                                  .updateFonts('Small',
                                                      TableNames.fontsize);
                                              SemanticsService.announce(
                                                "Small font selected",
                                                TextDirection.ltr,
                                              );
                                            },
                                          ),
                                          Text(
                                            'Small',
                                            style: TextStyle(
                                              color: activeFontName == 'Small'
                                                  ? isDark
                                                      ? CustomThemes()
                                                          .gettheme()
                                                          .whitecolor
                                                      : CustomThemes()
                                                          .gettheme()
                                                          .bgColor
                                                  : null,
                                              fontSize: 12 * activeFont,
                                              fontFamily: CustomThemes()
                                                  .gettheme()
                                                  .font2,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : FocusScope(
                                      child: Semantics(
                                      label: activeFontName == 'Small'
                                          ? 'Small Font Size selected'
                                          : 'Small Font Size button Double tap to activate',
                                      excludeSemantics: true,
                                      child: Column(
                                        children: [
                                          IconPreviewItem(
                                            iconPath: isDark
                                                ? activeFontName == 'Small'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .smalldarkselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .smallfontdark
                                                : activeFontName == 'Small'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .smallselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .smallfont,
                                            isSelected:
                                                activeFontName == 'Small',
                                            isDark: isDark,
                                            onImageTap: () {
                                              ref
                                                  .watch(fontProvider.notifier)
                                                  .updateFonts('Small',
                                                      TableNames.fontsize);
                                              SemanticsService.announce(
                                                "Small font selected",
                                                TextDirection.ltr,
                                              );
                                            },
                                          ),
                                          Text(
                                            'Small',
                                            style: TextStyle(
                                              color: activeFontName == 'Small'
                                                  ? isDark
                                                      ? CustomThemes()
                                                          .gettheme()
                                                          .whitecolor
                                                      : CustomThemes()
                                                          .gettheme()
                                                          .bgColor
                                                  : null,
                                              fontSize: isIpad
                                                  ? (CustomThemes()
                                                              .gettheme()
                                                              .fontsize1 +
                                                          CustomThemes()
                                                              .gettheme()
                                                              .ipadfontsize) *
                                                      activeFont
                                                  : CustomThemes()
                                                          .gettheme()
                                                          .fontsize1 *
                                                      activeFont,
                                              fontFamily: CustomThemes()
                                                  .gettheme()
                                                  .font2,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await AnalyticsService.userInteractionTrack();
                            ref
                                .watch(fontProvider.notifier)
                                .updateFonts('Medium', TableNames.fontsize);
                            SemanticsService.announce(
                              "Medium font selected",
                              TextDirection.ltr,
                            );
                          },
                          child: Column(
                            children: [
                              Platform.isIOS
                                  ? Semantics(
                                      label: activeFontName == 'Medium'
                                          ? 'Medium Font Size selected'
                                          : 'Medium Font Size  Double tap to activate',
                                      excludeSemantics: true,
                                      child: Column(
                                        children: [
                                          IconPreviewItem(
                                            iconPath: isDark
                                                ? activeFontName == 'Medium'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .mediumdarkselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .mediumfontdark
                                                : activeFontName == 'Medium'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .mediumselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .mediumfont,
                                            isSelected:
                                                activeFontName == 'Medium',
                                            isDark: isDark,
                                            onImageTap: () {
                                              ref
                                                  .watch(fontProvider.notifier)
                                                  .updateFonts('Medium',
                                                      TableNames.fontsize);
                                              SemanticsService.announce(
                                                "Medium font selected",
                                                TextDirection.ltr,
                                              );
                                            },
                                          ),
                                          Text(
                                            'Medium',
                                            style: TextStyle(
                                              color: activeFontName == 'Medium'
                                                  ? isDark
                                                      ? CustomThemes()
                                                          .gettheme()
                                                          .whitecolor
                                                      : CustomThemes()
                                                          .gettheme()
                                                          .bgColor
                                                  : null,
                                              fontSize: isIpad
                                                  ? (CustomThemes()
                                                              .gettheme()
                                                              .fontsize1 +
                                                          CustomThemes()
                                                              .gettheme()
                                                              .ipadfontsize) *
                                                      activeFont
                                                  : CustomThemes()
                                                          .gettheme()
                                                          .fontsize1 *
                                                      activeFont,
                                              fontFamily: CustomThemes()
                                                  .gettheme()
                                                  .font2,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : FocusScope(
                                      child: Semantics(
                                      label: activeFontName == 'Medium'
                                          ? 'Medium Font Size selected'
                                          : 'Medium Font Size  Double tap to activate',
                                      excludeSemantics: true,
                                      child: Column(
                                        children: [
                                          IconPreviewItem(
                                            iconPath: isDark
                                                ? activeFontName == 'Medium'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .mediumdarkselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .mediumfontdark
                                                : activeFontName == 'Medium'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .mediumselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .mediumfont,
                                            isSelected:
                                                activeFontName == 'Medium',
                                            isDark: isDark,
                                            onImageTap: () {
                                              ref
                                                  .watch(fontProvider.notifier)
                                                  .updateFonts('Medium',
                                                      TableNames.fontsize);
                                              SemanticsService.announce(
                                                "Medium font selected",
                                                TextDirection.ltr,
                                              );
                                            },
                                          ),
                                          Text(
                                            'Medium',
                                            style: TextStyle(
                                              color: activeFontName == 'Medium'
                                                  ? isDark
                                                      ? CustomThemes()
                                                          .gettheme()
                                                          .whitecolor
                                                      : CustomThemes()
                                                          .gettheme()
                                                          .bgColor
                                                  : null,
                                              fontSize: isIpad
                                                  ? (CustomThemes()
                                                              .gettheme()
                                                              .fontsize1 +
                                                          CustomThemes()
                                                              .gettheme()
                                                              .ipadfontsize) *
                                                      activeFont
                                                  : CustomThemes()
                                                          .gettheme()
                                                          .fontsize1 *
                                                      activeFont,
                                              fontFamily: CustomThemes()
                                                  .gettheme()
                                                  .font2,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await AnalyticsService.userInteractionTrack();
                            ref
                                .watch(fontProvider.notifier)
                                .updateFonts('Large', TableNames.fontsize);
                            SemanticsService.announce(
                              "Large font selected",
                              TextDirection.ltr,
                            );
                          },
                          child: Column(
                            children: [
                              Platform.isIOS
                                  ? Semantics(
                                      label: activeFontName == 'Large'
                                          ? 'Large Font Size selected'
                                          : 'Large Font Size  Double tap to activate',
                                      excludeSemantics: true,
                                      child: Column(
                                        children: [
                                          IconPreviewItem(
                                            iconPath: isDark
                                                ? activeFontName == 'Large'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .largedarkselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .largefontdark
                                                : activeFontName == 'Large'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .largeselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .largefont,
                                            isSelected:
                                                activeFontName == 'Large',
                                            isDark: isDark,
                                            onImageTap: () {
                                              ref
                                                  .watch(fontProvider.notifier)
                                                  .updateFonts('Large',
                                                      TableNames.fontsize);
                                              SemanticsService.announce(
                                                "Large font selected",
                                                TextDirection.ltr,
                                              );
                                            },
                                          ),
                                          Text(
                                            'Large',
                                            style: TextStyle(
                                              color: activeFontName == 'Large'
                                                  ? isDark
                                                      ? CustomThemes()
                                                          .gettheme()
                                                          .whitecolor
                                                      : CustomThemes()
                                                          .gettheme()
                                                          .bgColor
                                                  : null,
                                              fontSize: isIpad
                                                  ? (CustomThemes()
                                                              .gettheme()
                                                              .fontsize1 +
                                                          CustomThemes()
                                                              .gettheme()
                                                              .ipadfontsize) *
                                                      activeFont
                                                  : CustomThemes()
                                                          .gettheme()
                                                          .fontsize1 *
                                                      activeFont,
                                              fontFamily: CustomThemes()
                                                  .gettheme()
                                                  .font2,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : FocusScope(
                                      child: Semantics(
                                      label: activeFontName == 'Large'
                                          ? 'Large Font Size selected'
                                          : 'Large Font Size  Double tap to activate',
                                      excludeSemantics: true,
                                      child: Column(
                                        children: [
                                          IconPreviewItem(
                                            iconPath: isDark
                                                ? activeFontName == 'Large'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .largedarkselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .largefontdark
                                                : activeFontName == 'Large'
                                                    ? CustomThemes()
                                                        .gettheme()
                                                        .largeselected
                                                    : CustomThemes()
                                                        .gettheme()
                                                        .largefont,
                                            isSelected:
                                                activeFontName == 'Large',
                                            isDark: isDark,
                                            onImageTap: () {
                                              ref
                                                  .watch(fontProvider.notifier)
                                                  .updateFonts('Large',
                                                      TableNames.fontsize);
                                              SemanticsService.announce(
                                                "Large font selected",
                                                TextDirection.ltr,
                                              );
                                            },
                                          ),
                                          Text(
                                            'Large',
                                            style: TextStyle(
                                              color: activeFontName == 'Large'
                                                  ? isDark
                                                      ? CustomThemes()
                                                          .gettheme()
                                                          .whitecolor
                                                      : CustomThemes()
                                                          .gettheme()
                                                          .bgColor
                                                  : null,
                                              fontSize: isIpad
                                                  ? (CustomThemes()
                                                              .gettheme()
                                                              .fontsize1 +
                                                          CustomThemes()
                                                              .gettheme()
                                                              .ipadfontsize) *
                                                      activeFont
                                                  : CustomThemes()
                                                          .gettheme()
                                                          .fontsize1 *
                                                      activeFont,
                                              fontFamily: CustomThemes()
                                                  .gettheme()
                                                  .font2,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                    width: double.infinity,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 12,
                    width: double.infinity,
                  ),
                  FractionallySizedBox(
                    child: Row(children: [
                      Semantics(
                        excludeSemantics: true,
                        label: 'Appearance heading',
                        child: Text(
                          'Appearance',
                          style: TextStyle(
                            color: isDark
                                ? CustomThemes().gettheme().whitecolor
                                : CustomThemes().gettheme().black,
                            fontSize: isIpad
                                ? (CustomThemes().gettheme().fontsize5 +
                                        CustomThemes()
                                            .gettheme()
                                            .ipadfontsize) *
                                    activeFont
                                : CustomThemes().gettheme().fontsize5 *
                                    activeFont,
                            fontFamily: CustomThemes().gettheme().font1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 12,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Consumer(builder: (context, ref, child) {
                          final DarkModeNotifier darkModeNotifier =
                              ref.read(darkModeProvider.notifier);
                          return FocusScope(
                            child: Semantics(
                              excludeSemantics: true,
                              label: isDark
                                  ? "Light Mode  Double tap to activate"
                                  : "Light Mode  is on",
                              child: ModeSwitchButton(
                                buttonText: 'Light',
                                icon: Icons.wb_sunny,
                                isActive: !isDark,
                                onPressed: () async {
                                  darkModeNotifier.setLight();
                                  showModeSnackbar(context, "Light mode is ON");
                                },
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Flexible(
                        child: FocusScope(
                          child: Semantics(
                            excludeSemantics: true,
                            label: isDark
                                ? "Dark Mode  is on"
                                : "Dark Mode  Double tap to activate",
                            child: Consumer(builder: (context, ref, child) {
                              final DarkModeNotifier darkModeNotifier =
                                  ref.read(darkModeProvider.notifier);
                              return ModeSwitchButton(
                                buttonText: 'Dark',
                                icon: Icons.nightlight,
                                isActive: isDark,
                                onPressed: () {
                                  darkModeNotifier.setDark();
                                  showModeSnackbar(context, "Dark mode is ON");
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
