import 'package:flutter/material.dart';

class MainPagesAimcc {
  final Page inProgressPage;
  final Page archivesPage;
  final Page bookMarkPage;
  final Page settingsPage;
  MainPagesAimcc._({
    required this.inProgressPage,
    required this.archivesPage,
    required this.bookMarkPage,
    required this.settingsPage,
  });
  factory MainPagesAimcc._fromEnum() => MainPagesAimcc._(
        inProgressPage: Page(
            page: PageName.inProgressPage,
            pageKey: GlobalKey<NavigatorState>(),
            pageIndex: 0),
        archivesPage: Page(
            page: PageName.archivesPage,
            pageKey: GlobalKey<NavigatorState>(),
            pageIndex: 1),
        bookMarkPage: Page(
            page: PageName.bookMarkPage,
            pageKey: GlobalKey<NavigatorState>(),
            pageIndex: 2),
        settingsPage: Page(
            page: PageName.settingsPage,
            pageKey: GlobalKey<NavigatorState>(),
            pageIndex: 3),
      );
  factory MainPagesAimcc() => _obj;
  static final MainPagesAimcc _obj = MainPagesAimcc._fromEnum();
}

class Page {
  final GlobalKey<NavigatorState> pageKey;
  final int pageIndex;
  final PageName page;
  Page({required this.page, required this.pageKey, required this.pageIndex});
}

enum PageName {
  inProgressPage,
  bookMarkPage,
  settingsPage,
  archivesPage,
}
