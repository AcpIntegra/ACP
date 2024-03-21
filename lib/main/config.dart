library config;

import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:acp_app/data/models/annals_and_aimcc/user.dart';
import 'package:acp_app/data/models/guidelines/guidelines_issue.dart';
import 'package:acp_app/data/network/api/guidelines_api.dart';
import 'package:acp_app/data/network/service/error_logs.dart';
import 'package:acp_app/data/network/service/get_annals_articles.dart'
    as annals_utils;
import 'package:acp_app/data/network/service/get_aimcc_articles.dart'
    as aimcc_utils;
import 'package:acp_app/main.dart';
import 'package:acp_app/main/flavor_utils/aimcc_utils/firebase_options_aimcc.dart'
    as aimcc;
import 'package:acp_app/main/flavor_utils/annal_utils/firebase_options_annals.dart'
    as annals;
import 'package:acp_app/main/flavor_utils/guidelines_utils/firebase_options_guidelines.dart'
    as guidelines;

import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/main/flavor_utils/no_flavour.dart';
import 'package:acp_app/utils/constants/db_tables.dart';
import 'package:acp_app/utils/constants/guideline_table_columns.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
part '../data/local_db/sqlite.dart';
part '../data/local_db/database_helper.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackGroundHandler(RemoteMessage message) async {
  switch (F.appFlavor) {
    case Flavor.annals:
      await Firebase.initializeApp(
          options: annals.DefaultFirebaseOptions.currentPlatform);
      break;
    case Flavor.aimcc:
      await Firebase.initializeApp(
          options: aimcc.DefaultFirebaseOptions.currentPlatform);
    case Flavor.guidelines:
      await Firebase.initializeApp(
          options: guidelines.DefaultFirebaseOptions.currentPlatform);
    case null:
      null;
  }
}

class AnalyticsService {
  static Future<void> userInteractionTrack() async {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(name: 'button_tap', parameters: null);
  }
}

class Config {
  static final Config _obj = Config._();
  factory Config() => _obj;
  Config._();
  late final DatabaseHelper databaseHelper;
  late final DataRepository dataRepository;
  late final String path;
  late final String downloadPath;
  late final Directory guidelinesDownloadPath;
  late final SharedPreferences prefs;

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    if (F.appFlavor == Flavor.guidelines) {
      downloadPath = (await getApplicationDocumentsDirectory()).absolute.path;
      Directory guidelineDirectory =
          await Directory("$downloadPath/guidelines").create();
      guidelinesDownloadPath = guidelineDirectory;
    }
    await FlutterDownloader.initialize(debug: true, ignoreSsl: false);
    await _initialSqflite();
    await _initializeFirebaseAndApp();
  }

  void bindBackgroundIsolate(ReceivePort port) {
    final isSuccess = IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    FlutterDownloader.registerCallback(Config.downloadCallback, step: 1);
    if (!isSuccess) {
      unbindBackgroundIsolate();
      bindBackgroundIsolate(port);
      return;
    }
  }

  void unbindBackgroundIsolate() =>
      IsolateNameServer.removePortNameMapping('downloader_send_port');

  Future<void> _initializeFirebaseAndApp() async {
    switch (F.appFlavor) {
      case Flavor.aimcc:
        await _runApp(
            app: const MAIN(
                title: "Aimcc", futureCallback: aimcc_utils.fetchArticles),
            options: aimcc.DefaultFirebaseOptions.currentPlatform);
        break;
      case Flavor.guidelines:
        await _runApp(
            app: MAIN(
                title: "ACP Guidelines",
                futureCallback: () async =>
                    await GuidelinesApi().fetchGuidelinesArticle()),
            options: guidelines.DefaultFirebaseOptions.currentPlatform);
      case Flavor.annals:
        await _runApp(
            app: const MAIN(
                title: "Annals Of Internal Medicine",
                futureCallback: annals_utils.fetchArticles),
            options: annals.DefaultFirebaseOptions.currentPlatform);

      default:
        material.runApp(const NoFlavourScreen());
    }
  }

  Future<void> _runApp(
      {required material.Widget app, required FirebaseOptions options}) async {
    await Firebase.initializeApp(options: options);
    await _notificationSettings();
    _backGroundPushNotification();
    material.runApp(ProviderScope(child: app));
  }

  Future<void> _notificationSettings() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    await firebaseMessaging.setAutoInitEnabled(true);
  }

  Future<void> _initialSqflite() async {
    try {
      final Database database = await _db();
      databaseHelper = DatabaseHelper._(database);
      dataRepository = DataRepository._(database: database);
    } catch (e) {
      pushErrorLog('initialSqflite', jsonEncode(e));
    }
  }

  Future<Database> _db() async {
    final databasesPath = await getDatabasesPath();
    path = '$databasesPath/${F.appFlavor!.name}.db';

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database database, int version) async {
        switch (F.appFlavor) {
          case Flavor.annals:
            await DatabaseHelper.createAnnalsTables(database);
          case Flavor.aimcc:
            await DatabaseHelper.createAimccTables(database);
          case Flavor.guidelines:
            await DatabaseHelper.createGuidelinesTable(database);
          default:
        }
      },
    );
  }

  Future<void> _localNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidInitializationSettings androidInit =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosInit = const DarwinInitializationSettings();
    InitializationSettings initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);
    FlutterLocalNotificationsPlugin flt = FlutterLocalNotificationsPlugin();
    flt.initialize(initSettings);
    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails();
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('1', 'channelName');
    NotificationDetails generalNotificationDetails = NotificationDetails(
        iOS: iosNotificationDetails, android: androidNotificationDetails);
    return flt.show(notification.hashCode, notification?.title,
        notification?.body, generalNotificationDetails);
  }

  void pushNotifications() =>
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _localNotification(message);
      });

  void _backGroundPushNotification() =>
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackGroundHandler);
}
