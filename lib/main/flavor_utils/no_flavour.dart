import 'package:flutter/material.dart';

class NoFlavourScreen extends StatelessWidget {
  const NoFlavourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No Flavours choosen"),
      ),
      body: const Center(
        child: Text(
          'Please run with \n flutter run --flavor <flavor-name> -t lib/main_<flavor-name>.dart',
        ),
      ),
    );
  }
}
