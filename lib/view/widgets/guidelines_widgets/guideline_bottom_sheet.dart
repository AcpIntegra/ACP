import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidelineBottomSheet extends ConsumerWidget {
  const GuidelineBottomSheet({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
        color: isDark
            ? CustomThemes().gettheme().darkmodeblack
            : CustomThemes().gettheme().whitecolor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const DragHandle(),
          Padding(
            padding: const EdgeInsets.only(top: kMinInteractiveDimension),
            child: child,
          )
        ],
      ),
    );
  }
}

class DragHandle extends ConsumerWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(darkModeProvider);
    Size handleSize = const Size(32, 4);
    return SizedBox(
      height: kMinInteractiveDimension,
      width: kMinInteractiveDimension,
      child: Center(
        child: Container(
          height: handleSize.height,
          width: handleSize.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(handleSize.height / 2),
              color: isDark
                  ? Colors.white
                  : Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.4)),
        ),
      ),
    );
  }
}
