import 'dart:io';

import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/screens/collection/collection_details/collection_articles.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view/widgets/secondary_appbar.dart';
import 'package:acp_app/data/models/collections_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollectionPage extends ConsumerStatefulWidget {
  const CollectionPage({super.key});

  @override
  ConsumerState<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends ConsumerState<CollectionPage>
    with AutomaticKeepAliveClientMixin {
  bool listview = true;

  @override
  Widget build(BuildContext context) {
    double activeFont = ref.watch(fontProvider).size;
    final List<ACPJournalClub> list = collectionList();
    super.build(context);
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    return Semantics(
        label:
            'Collections Screen', // Provide a meaningful label for the screen
        child: Scaffold(
          appBar: const SecondaryAppBar(title: "Collections"),
          body: Semantics(
            label: 'List of collections',
            explicitChildNodes: true,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              itemCount: list.length,
              separatorBuilder: (context, index) => Divider(
                color: CustomThemes().gettheme().greybackground,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                return FocusScope(
                  child: Semantics(
                    excludeSemantics: true,
                    label: '''${list[index].content} Double tap to activate''',
                    child: ListTile(
                      onTap: () async => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OverallCollection(
                                  title: list[index].tablename)),
                        ),
                        await AnalyticsService.userInteractionTrack(),
                      },
                      leading: Image(
                        image: AssetImage(
                          list[index].icon,
                        ),
                        color: null,
                      ),
                      title: Text(
                        list[index].content,
                        style: TextStyle(
                          fontFamily: CustomThemes().gettheme().font1,
                          fontWeight: FontWeight.w700,
                          fontSize: isIpad
                              ? (CustomThemes().gettheme().fontsize4 +
                                      CustomThemes().gettheme().ipadfontsize) *
                                  activeFont
                              : CustomThemes().gettheme().fontsize4 *
                                  activeFont,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }

  List<ACPJournalClub> collectionList() {
    final Collections collections = Collections();
    return [
      collections.aCPJournalClub,
      collections.beyondTheGuidelines,
      collections.clinicalGuidelines,
      collections.cOVID19,
      collections.inTheClinic,
      collections.onBeingADoctor,
      collections.originalResearch,
      collections.reviews
    ];
  }

  @override
  bool get wantKeepAlive => false;
}
