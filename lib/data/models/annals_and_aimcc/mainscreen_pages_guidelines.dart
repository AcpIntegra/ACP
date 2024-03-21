import 'package:flutter/material.dart';

class MainPagesGuidelines {
  static final MainPagesGuidelines _obj =
      MainPagesGuidelines._(GlobalKey<NavigatorState>(), "Guidelines");
  factory MainPagesGuidelines() => _obj;
  const MainPagesGuidelines._(this.pageKey, this.pageName);
  final String pageName;
  final GlobalKey<NavigatorState> pageKey;
}
