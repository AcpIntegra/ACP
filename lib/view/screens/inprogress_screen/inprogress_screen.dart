// import 'package:acp_app/view/view_utils/themes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// import 'package:back_button_interceptor/back_button_interceptor.dart';

// class InProgress extends ConsumerStatefulWidget {
//   const InProgress({super.key});

//   @override
//   ConsumerState<InProgress> createState() => _InProgressState();
// }

// class _InProgressState extends ConsumerState<InProgress>
//     with AutomaticKeepAliveClientMixin {
//   late WebViewController webViewController;
//   late PlatformWebViewControllerCreationParams webViewControllerCreationParams;
//   late PlatformNavigationDelegateCreationParams
//       navigationDelegateCreationParams;
//   int loadingPercent = 0;

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
//     BackButtonInterceptor.add(myInterceptor);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     BackButtonInterceptor.remove(myInterceptor);
//     super.dispose();
//   }

//   bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
//     // if (stopDefaultButtonEvent) {
//     webViewController.goBack();
//     // }
//     return true;
//   }

//   @override
//   void didChangeDependencies() {
//     Uri acpArticle = Uri(
//       scheme: "https",
//       host: "acpjournals.org",
//       path: 'toc/aimcc/current',
//     );
//     webViewController = WebViewController.fromPlatformCreationParams(
//         webViewControllerCreationParams)
//       ..loadRequest(acpArticle)
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
//     return NavigationDelegate.fromPlatformCreationParams(
//         navigationDelegateCreationParams,
//         onProgress: (int value) {
//           (mounted)
//               ? setState(() {
//                   loadingPercent = value;
//                 })
//               : null;
//         },
//         onPageStarted: (url) => loadingPercent = 0,
//         onPageFinished: (url) => loadingPercent = 100);
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

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       body: Stack(
//         children: [
//           WebViewWidget(controller: webViewController),
//           // ignore: deprecated_member_use
//           WillPopScope(
//             onWillPop: () async {
//               if (await webViewController.canGoBack()) {
//                 webViewController.goBack();
//                 return false;
//               }
//               return true;
//             },
//             child: WebViewWidget(controller: webViewController),
//           ),
//           Visibility(
//               visible: loadingPercent > 0 && loadingPercent < 100,
//               child: LinearProgressIndicator(
//                 color: CustomThemes().gettheme().bgColor,
//                 minHeight: 3,
//                 value: loadingPercent / 100,
//               )),
//         ],
//       ),
//     );
//   }
// }
