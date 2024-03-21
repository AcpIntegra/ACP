import 'package:acp_app/main/config.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorScreen extends ConsumerWidget {
  final int errorCode;
  final bool isHeader;
  // Add a parameter to accept the error code

  const ErrorScreen(
      {super.key,
      required this.errorCode,
      required this.isHeader}); // Constructor to receive the error code

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String errorMessage = '';
    final isDark = ref.watch(darkModeProvider);

    // Set error message based on the error code
    if (errorCode == 404) {
      errorMessage = 'YOU ARE OFFLINE';
    } else if (errorCode == 500) {
      errorMessage = '500';
    } else {
      errorMessage = 'Unknown Error';
    }

    String errorDescription = '';
    // Set error description based on the error code
    if (errorCode == 404) {
      errorDescription = 'ARTICLE NOT AVAILABLE';
    } else if (errorCode == 500) {
      errorDescription = 'INTERNAL SERVER ERROR';
    } else {
      errorDescription = 'Unknown Error';
    }

    return Scaffold(
      appBar: isHeader ? regularAppBar(context) : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Semantics(
              label: errorMessage,
              child: Text(
                errorMessage,
                style: TextStyle(
                  color: isDark
                      ? CustomThemes().gettheme().whitecolor
                      : CustomThemes().gettheme().bgColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Semantics(
              label: errorDescription,
              child: Text(
                errorDescription,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? CustomThemes().gettheme().whitecolor
                      : CustomThemes().gettheme().black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar regularAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: CustomThemes().gettheme().bgColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: FocusScope(
              child: Semantics(
                label: 'back button double tap to activate',
                excludeSemantics: true,
                child: GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    await AnalyticsService.userInteractionTrack();
                  },
                  child: Image.asset(
                    CustomThemes().gettheme().leftarrow.toString(),
                    width: 24.0,
                    height: 24.0,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
