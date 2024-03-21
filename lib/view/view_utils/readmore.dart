import 'dart:io';

import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadMoreText extends ConsumerStatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.style,
  });

  @override
  ReadMoreTextState createState() => ReadMoreTextState();
}

class ReadMoreTextState extends ConsumerState<ReadMoreText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final isIpad =
        Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
    double activeFont = ref.watch(fontProvider).size;
    final textWidget = Align(
      alignment: Alignment.centerLeft,
      child: Text(
        widget.text,
        maxLines: !_expanded ? widget.maxLines : null,
        style: widget.style,
        overflow: !_expanded ? TextOverflow.ellipsis : TextOverflow.visible,
      ),
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Semantics(
          excludeSemantics: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget,
              !_expanded
                  ? Text(
                      'Read more',
                      style: TextStyle(
                        color: ref.watch(darkModeProvider)
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().black,
                        fontWeight: FontWeight.bold,
                        fontSize: isIpad
                            ? (CustomThemes().gettheme().fontsize1 +
                                    CustomThemes().gettheme().ipadfontsize) *
                                activeFont
                            : CustomThemes().gettheme().fontsize1 * activeFont,
                      ),
                    )
                  : Text(
                      'Read less',
                      style: TextStyle(
                        color: ref.watch(darkModeProvider)
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().black,
                        fontWeight: FontWeight.bold,
                        fontSize: isIpad
                            ? (CustomThemes().gettheme().fontsize1 +
                                    CustomThemes().gettheme().ipadfontsize) *
                                activeFont
                            : CustomThemes().gettheme().fontsize1 * activeFont,
                      ),
                    )
            ],
          )),
    );
  }
}
