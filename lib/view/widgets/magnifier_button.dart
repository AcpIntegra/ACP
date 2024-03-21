import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MagnifierButton extends ConsumerWidget {
  const MagnifierButton(
      {super.key, required this.onTapZoomOut, required this.onTapZoomIn});

  final void Function() onTapZoomOut;
  final void Function() onTapZoomIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(darkModeProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => onTapZoomOut.call(),
          child: Ink(
            child: Container(
              decoration: BoxDecoration(
                  border: const Border(right: BorderSide(color: Colors.black)),
                  color: isDark
                      ? CustomThemes().gettheme().darkmodegrey
                      : CustomThemes().gettheme().whitecolor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.5, vertical: 6),
                child: FocusScope(
                  child: Semantics(
                    label: 'Zoom Out Buttton double tap to zoom out',
                    excludeSemantics: true,
                    child: Icon(
                      Icons.zoom_out,
                      size: 30,
                      color: isDark
                          ? CustomThemes().gettheme().whitecolor
                          : CustomThemes().gettheme().darkmodegrey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onTapZoomIn.call(),
          child: Container(
              decoration: BoxDecoration(
                  color: isDark
                      ? CustomThemes().gettheme().darkmodegrey
                      : CustomThemes().gettheme().whitecolor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12.5),
                  child: FocusScope(
                    child: Semantics(
                      label: 'Zoom in Buttton double tap to zoom in',
                      excludeSemantics: true,
                      child: Icon(
                        Icons.zoom_in,
                        size: 30,
                        color: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().darkmodegrey,
                      ),
                    ),
                  ))),
        )
      ],
    );
  }
}
