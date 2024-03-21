import 'dart:io';

import 'package:acp_app/data/models/annals_and_aimcc/mainscreen_pages_aimcc.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/screens/article_screen/article_webview.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:acp_app/view/widgets/secondary_appbar.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArchivesPage extends ConsumerStatefulWidget {
  const ArchivesPage({super.key});

  @override
  ConsumerState<ArchivesPage> createState() => _ArchivesPageState();
}

class _ArchivesPageState extends ConsumerState<ArchivesPage>
    with AutomaticKeepAliveClientMixin {
  late double fontSizeFactor = 0.0;

  final List<String> monthNames = [
    '', // Index 0 is unused to align with month numbering
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String getMonthName(int month) {
    if (month >= 1 && month <= 12) {
      return monthNames[month];
    } else {
      return ''; // Return empty string for invalid month numbers
    }
  }

  Map<String, List<Map<String, dynamic>>> generateArchives(
      String pubDateString) {
    final minDate = DateTime.utc(2022, 1, 1);
    final pubDate = DateTime.now();
    final archivesByYear = <String, List<Map<String, dynamic>>>{};
    for (int year = pubDate.year; year > minDate.year - 1; year--) {
      final vol = year - minDate.year + 1;
      final maxIssues = vol == 1 ? 10 : 12;

      final archives = <Map<String, dynamic>>[];

      for (int iss = 1; iss <= maxIssues; iss++) {
        int month = iss - 1;
        if (vol == 1) {
          month += 2;
        }
        final uniqueId = 'archive_${year}_$iss';
        final archive = {
          'id': uniqueId,
          'date': DateTime.utc(year, month + 1).toString(),
          'issue': iss,
          'link': 'https://www.acpjournals.org/toc/aimcc/$vol/$iss',
          'volume': vol,
        };

        archives.add(archive);
      }

      archivesByYear[year.toString()] = archives;
    }
    return Map.fromEntries(archivesByYear.entries.toList().reversed);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    super.build(context);
    const pubDate = '2024-01-02T08:00:00Z';
    final archivesByYear = generateArchives(pubDate);
    double activeFont = ref.watch(fontProvider).size;
    final bool isDark = ref.watch(darkModeProvider);
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Semantics(
      explicitChildNodes: true,
      label: "archives screen",
      child: Scaffold(
        appBar: const SecondaryAppBar(title: "Archives"),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Center(
              child: Semantics(
                label: "Preview of Archives Cover Image",
                child: ExcludeSemantics(
                  child: Image.asset(
                    CustomThemes().gettheme().archiveheader,
                    height: 176.0,
                    width: 346,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: archivesByYear.length,
                itemBuilder: (BuildContext context, int index) {
                  final year = archivesByYear.keys.elementAt(index);
                  final archives = archivesByYear[year]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          year,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ref.watch(darkModeProvider)
                                ? CustomThemes().gettheme().whitecolor
                                : CustomThemes().gettheme().bgColor,
                            fontSize: isIpad
                                ? (CustomThemes().gettheme().fontsize5 +
                                        CustomThemes()
                                            .gettheme()
                                            .ipadfontsize) *
                                    activeFont
                                : CustomThemes().gettheme().fontsize5 *
                                    activeFont,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: archives.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = archives[index];
                          var month =
                              getMonthName(DateTime.parse(item['date']).month);
                          var isActiveMonth = DateTime.parse(item['date'])
                              .isBefore(DateTime.now());
                          var darktextColor = isActiveMonth
                              ? CustomThemes().gettheme().whitecolor
                              : const Color(0xFF999999);
                          var lighttextColor = isActiveMonth
                              ? CustomThemes().gettheme().black
                              : const Color(0xff6f6d6d);
                          return Semantics(
                            child: GestureDetector(
                              onTap: () async {
                                if (isActiveMonth) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ArticleWebView(
                                        key: const GlobalObjectKey<
                                                ArticleWebViewState>(
                                            PageName.archivesPage),
                                        addAppBar: true,
                                        addMagnifierButton: true,
                                        enableDownload: true,
                                        backButtonHandler: true,
                                        articleItem: item,
                                      ),
                                    ),
                                  );
                                  await AnalyticsService.userInteractionTrack();
                                }
                              },
                              child: ListTile(
                                enabled: isActiveMonth,
                                leading: ImageIcon(
                                  AssetImage(
                                    CustomThemes().gettheme().archivesicon,
                                  ),
                                  color:
                                      isDark ? darktextColor : lighttextColor,
                                ),
                                title: Platform.isAndroid
                                    ? Text(
                                        'Volume ${item['volume']} | Issue ${item['issue']} | $month ${DateTime.parse(item['date']).year}',
                                        style: TextStyle(
                                          fontSize: isIpad
                                              ? (CustomThemes()
                                                          .gettheme()
                                                          .fontsize2 +
                                                      CustomThemes()
                                                          .gettheme()
                                                          .ipadfontsize) *
                                                  activeFont
                                              : CustomThemes()
                                                      .gettheme()
                                                      .fontsize2 *
                                                  activeFont,
                                          color: isDark
                                              ? darktextColor
                                              : lighttextColor,
                                        ),
                                      )
                                    : Semantics.fromProperties(
                                        excludeSemantics: true,
                                        properties: SemanticsProperties(
                                          label: isActiveMonth
                                              ? 'Volume ${item['volume']}  Issue ${item['issue']}  $month ${DateTime.parse(item['date']).year} double tap to activate'
                                              : 'Volume ${item['volume']}  Issue ${item['issue']}  $month ${DateTime.parse(item['date']).year} disabled',
                                        ),
                                        child: Text(
                                          'Volume ${item['volume']} | Issue ${item['issue']} | $month ${DateTime.parse(item['date']).year}',
                                          style: TextStyle(
                                            fontSize: isIpad
                                                ? (CustomThemes()
                                                            .gettheme()
                                                            .fontsize2 +
                                                        CustomThemes()
                                                            .gettheme()
                                                            .ipadfontsize) *
                                                    activeFont
                                                : CustomThemes()
                                                        .gettheme()
                                                        .fontsize2 *
                                                    activeFont,
                                            color: isDark
                                                ? darktextColor
                                                : lighttextColor,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
