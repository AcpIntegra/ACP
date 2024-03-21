import 'package:acp_app/main/config.dart';
import 'package:flutter/material.dart';

class IconPreviewItem extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final bool isDark;
  final Function? onImageTap;

  const IconPreviewItem({
    super.key,
    required this.iconPath,
    required this.isDark,
    this.isSelected = false,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await AnalyticsService.userInteractionTrack();
        if (onImageTap != null) {
          onImageTap?.call();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(
          iconPath,
          height: 60,
          width: 90,
        ),
      ),
    );
  }
}
