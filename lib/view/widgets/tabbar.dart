import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.controller});
  final TabController controller;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(controller: widget.controller, tabs: const <Widget>[
      Tab(icon: Icon(Icons.home_filled)),
      Tab(
        icon: Icon(Icons.collections),
      ),
      Tab(icon: Icon(Icons.bookmark_add)),
      Tab(
        icon: Icon(Icons.person),
      ),
      Tab(icon: Icon(Icons.settings))
    ]);
  }
}
