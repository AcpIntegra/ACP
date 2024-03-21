// import 'dart:convert';
// import 'dart:io';
// import 'dart:isolate';

// import 'package:acp_app/data/network/service/connectivity.dart';
// import 'package:acp_app/main/config.dart';
// import 'package:acp_app/view/screens/error_screen/error_page.dart';
// import 'package:acp_app/view/view_utils/themes.dart';
// import 'package:acp_app/view_model/notifiers/value_notifier.dart';
// import 'package:acp_app/view_model/providers/font_provider.dart';
// import 'package:acp_app/view_model/providers/loading_progress_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// import 'package:back_button_interceptor/back_button_interceptor.dart';

// class LatestIssue extends ConsumerStatefulWidget {
//   final Map<String, dynamic> articleItem;
//   const LatestIssue({
//     super.key,
//     required this.articleItem,
//   });

//   @override
//   ConsumerState<LatestIssue> createState() => _LatestIssuePageState();
// }

// class _LatestIssuePageState extends ConsumerState<LatestIssue>
//     with AutomaticKeepAliveClientMixin {
//   late WebViewController webViewController;
//   late PlatformWebViewControllerCreationParams webViewControllerCreationParams;
//   late PlatformNavigationDelegateCreationParams
//       navigationDelegateCreationParams;
//   late double activeFont;
//   String? cookie;
//   final ReceivePort port = ReceivePort();
//   Uri acpArticle = Uri(
//     scheme: "https",
//     host: "acpjournals.org",
//     path: 'toc/aim/current',
//   );
//   @override
//   bool get wantKeepAlive => true;
//   @override
//   void initState() {
//     (
//       PlatformWebViewControllerCreationParams,
//       PlatformNavigationDelegateCreationParams
//     ) params = initController();
//     webViewControllerCreationParams = params.$1;
//     navigationDelegateCreationParams = params.$2;
//     Config().bindBackgroundIsolate(port);
//     BackButtonInterceptor.add(myInterceptor);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     BackButtonInterceptor.remove(myInterceptor);
//     Config().unbindBackgroundIsolate();

//     super.dispose();
//   }

//   bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
//     // if (stopDefaultButtonEvent) {
//     webViewController.goBack();
//     // }
//     return true;
//   }

//   void download(String change) async {
//     final directory = await getApplicationDocumentsDirectory();
//     await FlutterDownloader.enqueue(
//       url: change,
//       headers: {"User-Agent": "${DateTime.now()}"},
//       savedDir: directory.absolute.path,
//       showNotification: true,
//       openFileFromNotification: true,
//       saveInPublicStorage: true,
//     );
//   }

//   @override
//   void didChangeDependencies() {
//     activeFont = ref.watch(fontProvider).size;

//     webViewController = WebViewController.fromPlatformCreationParams(
//         webViewControllerCreationParams)
//       ..setBackgroundColor(Colors.transparent)
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//           navigationDelegate(navigationDelegateCreationParams));
//     if (webViewController is AndroidWebViewController) {
//       AndroidWebViewController.enableDebugging(true);
//       (webViewController as AndroidWebViewController)
//           .setMediaPlaybackRequiresUserGesture(false);
//     }
//     super.didChangeDependencies();
//   }

//   NavigationDelegate navigationDelegate(
//       PlatformNavigationDelegateCreationParams
//           navigationDelegateCreationParams) {
//     bool isConnected = false;
//     bool firstTime = true;
//     return NavigationDelegate.fromPlatformCreationParams(
//         navigationDelegateCreationParams,
//         onProgress: (int value) => (mounted)
//             ? ref.watch(loadingProvider.notifier).changeLoadingPercent(value)
//             : null,
//         onPageStarted: (url) async {
//           if (!mounted) return;
//           ref.watch(loadingProvider.notifier).changeLoadingPercent(0);
//           isConnected = await ConnectivityStatus().checkConnection();
//         },
//         onPageFinished: (url) async {
//           if (!mounted) return;
//           ref.watch(loadingProvider.notifier).changeLoadingPercent(100);
//           if (isConnected) {
//             final val = await webViewController.runJavaScriptReturningResult(
//                 'document.documentElement.outerHTML') as String;
//             if (Platform.isAndroid) {
//               final html = jsonDecode(val);
//               if (html != null) {
//                 await DataRepository().insertHtml({'id': 'issueoffline'}, html);
//               }
//             } else if (Platform.isIOS) {
//               await DataRepository().insertHtml({'id': 'issueoffline'}, val);
//             }
//           }
//           ref.watch(valueProvider.notifier).changeDynamic(true);
//           double multipliedFontSize = activeFont * 16;
//           String javascriptCode = '''
//           document.getElementsByTagName("body")[0].style.fontSize = "${multipliedFontSize}px";
//           document.documentElement.style.fontSize = "${multipliedFontSize}px";
//         ''';
//           await webViewController.runJavaScriptReturningResult(javascriptCode);
//         },
//         onNavigationRequest: (request) async {
//           if (firstTime) {
//             firstTime = false;
//             return NavigationDecision.navigate;
//           } else {
//             if ((request.url.toLowerCase().contains("audio")) ||
//                 request.url.toLowerCase().contains("pdf")) {
//               download(request.url);
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           }
//         });
//   }

//   (
//     PlatformWebViewControllerCreationParams,
//     PlatformNavigationDelegateCreationParams
//   ) initController() {
//     PlatformWebViewControllerCreationParams params =
//         const PlatformWebViewControllerCreationParams();
//     PlatformNavigationDelegateCreationParams navigationDelegateCreationParams =
//         const PlatformNavigationDelegateCreationParams();

//     if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       params = WebKitWebViewControllerCreationParams
//           .fromPlatformWebViewControllerCreationParams(params);
//       navigationDelegateCreationParams = WebKitNavigationDelegateCreationParams
//           .fromPlatformNavigationDelegateCreationParams(
//               navigationDelegateCreationParams);
//     } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
//       params = AndroidWebViewControllerCreationParams
//           .fromPlatformWebViewControllerCreationParams(params);
//       navigationDelegateCreationParams = AndroidNavigationDelegateCreationParams
//           .fromPlatformNavigationDelegateCreationParams(
//               navigationDelegateCreationParams);
//     }
//     return (params, navigationDelegateCreationParams);
//   }

//   Future<bool> canGoBack() async => webViewController.canGoBack();

//   Future<bool> connectWeb() async {
//     bool val = await ConnectivityStatus().checkConnection();

//     if (!val) {
//       final String? html = await DataRepository().getHtml(widget.articleItem);
//       if (html != null) {
//         webViewController.loadHtmlString(html,
//             baseUrl: "https://www.acpjournals.org/");
//       }
//     } else {
//       webViewController.loadRequest(acpArticle);
//     }
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       // ignore: deprecated_member_use
//       body: FutureBuilder<bool>(
//         future: connectWeb(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return const ErrorScreen(errorCode: 404, isHeader: false);
//           } else {
//             return Consumer(builder: (context, ref, child) {
//               var loadingPercent = ref.watch(loadingProvider);
//               return Stack(
//                 children: [
//                   // ignore: deprecated_member_use
//                   WillPopScope(
//                     onWillPop: () async {
//                       if (await webViewController.canGoBack()) {
//                         webViewController.goBack();
//                         return false;
//                       }
//                       return true;
//                     },
//                     child: WebViewWidget(controller: webViewController),
//                   ),
//                   Visibility(
//                     visible: loadingPercent > 0 && loadingPercent < 100,
//                     child: LinearProgressIndicator(
//                       color: CustomThemes().gettheme().bgColor,
//                       minHeight: 3,
//                       value: loadingPercent / 100,
//                     ),
//                   ),
//                 ],
//               );
//             });
//           }
//         },
//       ),
//     );
//   }
// }
