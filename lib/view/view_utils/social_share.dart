import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SocialShare {
  static final SocialShare _obj = SocialShare._();
  factory SocialShare() => _obj;
  SocialShare._();

  void onShareText(
      {required BuildContext context,
      required String text,
      String? subject,
      bool withResult = false}) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    if (withResult) {
      final ShareResult result = await Share.shareWithResult(text,
          subject: subject,
          sharePositionOrigin:
              renderBox.localToGlobal(Offset.zero) & renderBox.size);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(_getSnackBar(result));
      }
    } else {
      Share.share(text,
          subject: subject,
          sharePositionOrigin:
              renderBox.localToGlobal(Offset.zero) & renderBox.size);
    }
  }

  SnackBar _getSnackBar(ShareResult result) {
    return SnackBar(
        content: (result.status == ShareResultStatus.success)
            ? Text("Successfully shared: ${result.raw}")
            : const Text("Failed"));
  }
}
