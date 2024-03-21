import 'package:flutter/material.dart';

class MainPagesAnnals {
  final Page articlePage;
  final Page issuePage;
  final Page multimediaPage;
  final Page collectionPage;
  final Page settingsPage;
  MainPagesAnnals._(
      {required this.articlePage,
      required this.collectionPage,
      required this.issuePage,
      required this.multimediaPage,
      required this.settingsPage});
  factory MainPagesAnnals._fromEnum() => MainPagesAnnals._(
      articlePage: Page(
          page: PageName.articlePage,
          pageKey: GlobalKey<NavigatorState>(),
          pageIndex: 0),
      collectionPage: Page(
          page: PageName.collectionPage,
          pageKey: GlobalKey<NavigatorState>(),
          pageIndex: 3),
      issuePage: Page(
          page: PageName.issuePage,
          pageKey: GlobalKey<NavigatorState>(),
          pageIndex: 1),
      multimediaPage: Page(
          page: PageName.multimediaPage,
          pageKey: GlobalKey<NavigatorState>(),
          pageIndex: 2),
      settingsPage: Page(
          page: PageName.settingsPage,
          pageKey: GlobalKey<NavigatorState>(),
          pageIndex: 4));
  factory MainPagesAnnals() => _obj;
  static final MainPagesAnnals _obj = MainPagesAnnals._fromEnum();
}

class Page {
  final GlobalKey<NavigatorState> pageKey;
  final int pageIndex;
  final PageName page;
  Page({required this.page, required this.pageKey, required this.pageIndex});
}

enum PageName {
  articlePage,
  issuePage,
  multimediaPage,
  collectionPage,
  settingsPage
}
