import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/article_provider.dart';
import 'package:acp_app/view_model/providers/collection_provider.dart';
import 'package:acp_app/view_model/providers/currentissue_provider.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class BookmarkWidget extends ConsumerStatefulWidget {
  const BookmarkWidget(
      {super.key,
      required this.isBookmarked,
      required this.item,
      required this.notifier,
      required this.tablename});

  final int isBookmarked;
  final Map<String, dynamic> item;
  final CollectionNotifer notifier;
  final String tablename;

  @override
  ConsumerState<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends ConsumerState<BookmarkWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isDark = ref.watch(darkModeProvider);

    FocusScope iconSemantics = FocusScope(
      child: Semantics.fromProperties(
        excludeSemantics: true,
        properties: widget.item['is_bookmarked'] == 1
            ? const SemanticsProperties(
                label: 'Remove bookmark Double tap to activate')
            : const SemanticsProperties(
                label: 'Add bookmark Double tap to activate'),
        child: GestureDetector(
          onTap: () async {
            if (widget.item['is_bookmarked'] == 1) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bookmark removed'),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bookmark added'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            widget.notifier.updateBookMark(widget.item, widget.tablename);
            await ref
                .watch(currentIssueArticlesProvider.notifier)
                .getUpdatedIssues();
            await ref.read(allArticlesProvider.notifier).updateArticles();
          },
          child: widget.item['is_bookmarked'] == widget.isBookmarked
              ? Icon(
                  Icons.bookmark_added,
                  size: 28,
                  color: isDark
                      ? CustomThemes().gettheme().whitecolor
                      : CustomThemes().gettheme().bgColor,
                )
              : Icon(
                  Icons.bookmark_add_outlined,
                  size: 28,
                  color: isDark
                      ? CustomThemes().gettheme().whitecolor
                      : CustomThemes().gettheme().bgColor,
                ),
        ),
      ),
    );

    return iconSemantics;
  }
}
