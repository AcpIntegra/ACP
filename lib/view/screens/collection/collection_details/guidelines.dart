// Dummy Guildlines page
import 'package:flutter/material.dart';
import 'package:acp_app/view/view_utils/themes.dart';

class GuideLinesPage extends StatefulWidget {
  const GuideLinesPage({super.key});

  @override
  State<GuideLinesPage> createState() => _GuideLinesPageState();
}

class _GuideLinesPageState extends State<GuideLinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: CustomThemes().gettheme().bgColor,
          title: const Text("GuideLines")),
      body: Center(
        child: Text(
          "GuideLines",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
