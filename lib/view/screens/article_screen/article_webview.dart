library webview;

import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:acp_app/data/models/guidelines/guidelines_issue.dart';
import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/utils/css.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:acp_app/data/network/service/connectivity.dart';
import 'package:acp_app/main/config.dart';
import 'package:acp_app/view/screens/error_screen/error_page.dart';
import 'package:acp_app/view/view_utils/navigation_callback.dart';
import 'package:acp_app/view/view_utils/social_share.dart';
import 'package:acp_app/view/view_utils/themes.dart';
import 'package:acp_app/view/widgets/magnifier_button.dart';
import 'package:acp_app/view/widgets/guidelines_widgets/guideline_recommendation_sheet.dart';
import 'package:acp_app/view_model/notifiers/value_notifier.dart';
import 'package:acp_app/view_model/providers/auth_provider/login_provider.dart';
import 'package:acp_app/view_model/providers/darkmode_provider.dart';
import 'package:acp_app/view_model/providers/font_provider.dart';
import 'package:acp_app/view_model/providers/guideline_scale_provider.dart';
import 'package:acp_app/view_model/providers/loading_progress_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:html/dom.dart' as dom;

part '../guidline_screen/guideline_webview.dart';

class ArticleWebView extends ConsumerStatefulWidget {
  const ArticleWebView(
      {super.key,
      required this.articleItem,
      required this.addAppBar,
      required this.backButtonHandler,
      required this.enableDownload,
      required this.addMagnifierButton});
  final Map<String, dynamic> articleItem;
  final bool backButtonHandler;
  final bool enableDownload;
  final bool addAppBar;
  final bool addMagnifierButton;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ArticleWebViewState();
}

class ArticleWebViewState extends ConsumerState<ArticleWebView> {
  late WebViewController webViewController;
  late PlatformWebViewControllerCreationParams webViewControllerCreationParams;
  late PlatformNavigationDelegateCreationParams
      navigationDelegateCreationParams;
  late Uri acpArticle;
  late String redirectLink;
  late bool showButton;
  double _scale = 1.0;
  late double activeFont;

  void _zoomIn() {
    (mounted)
        ? setState(() {
            _scale *= 1.2; // Increase scale by 20%
          })
        : null;
  }

  // Implement _zoomOut method
  void _zoomOut() {
    (mounted)
        ? setState(() {
            _scale /= 1.2; // Decrease scale by 20%
          })
        : null;
  }

  @override
  void didChangeDependencies() {
    activeFont = ref.watch(fontProvider).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(valueProvider.notifier).changeDynamic(false);
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    if (!mounted) return;
    (
      PlatformWebViewControllerCreationParams,
      PlatformNavigationDelegateCreationParams
    ) params = initController();
    webViewControllerCreationParams = params.$1;
    navigationDelegateCreationParams = params.$2;
    ConnectivityStatus().ensureInitialized();
    redirectLink = widget.articleItem['link'];
    acpArticle = Uri(
        scheme: "https",
        host: "acpjournals.org",
        path: '/action/idpTokenAuthentication',
        queryParameters: {
          'idpCode': 'acp',
          'token': ref.read(loginProvider).accessToken,
          'redirectUri': redirectLink
        });
    webViewController = WebViewController.fromPlatformCreationParams(
        webViewControllerCreationParams)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          navigationDelegate(navigationDelegateCreationParams))
      ..enableZoom(true);

    if (webViewController is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (webViewController as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    super.initState();
  }

  NavigationDelegate navigationDelegate(
      PlatformNavigationDelegateCreationParams
          navigationDelegateCreationParams) {
    bool isConnected = false;
    bool firstTime = false;
    return NavigationDelegate.fromPlatformCreationParams(
        navigationDelegateCreationParams,
        onProgress: (int value) => (mounted)
            ? ref.watch(loadingProvider.notifier).changeLoadingPercent(value)
            : null,
        onPageStarted: (url) async {
          (mounted)
              ? ref.watch(loadingProvider.notifier).changeLoadingPercent(0)
              : null;
          isConnected =
              (mounted) ? await ConnectivityStatus().checkConnection() : false;
        },
        onPageFinished: (url) async {
          if (isConnected && mounted) {
            final val = await webViewController.runJavaScriptReturningResult(
                'document.documentElement.innerHTML') as String;
            if (Platform.isAndroid) {
              final html = jsonDecode(val);
              if (html != null) {
                await DataRepository().insertHtml(widget.articleItem, html);
              }
            } else if (Platform.isIOS) {
              await DataRepository().insertHtml(widget.articleItem, val);
            }
          }
          if (mounted) {
            // Update the flag when loading is completed

            ref.watch(valueProvider.notifier).changeDynamic(true);
            double multipliedFontSize = activeFont * 16;
            String javascriptCode = '''
          document.getElementsByTagName("body")[0].style.fontSize = "${multipliedFontSize}px";
          document.documentElement.style.fontSize = "${multipliedFontSize}px";
        ''';
            await webViewController
                .runJavaScriptReturningResult(javascriptCode);
          }
        },
        onNavigationRequest: (request) async {
          if (widget.enableDownload) {
            if (firstTime && Platform.isIOS) {
              firstTime = false;
              return NavigationDecision.navigate;
            } else {
              if ((request.url.toLowerCase().contains("audio")) ||
                  request.url.toLowerCase().contains("showtocpdf") ||
                  request.url.toLowerCase().contains("download")) {
                download(request.url);
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            }
          } else {
            return NavigationDecision.navigate;
          }
        });
  }

  void download(String change) async {
    bool canGoBack = await webViewController.canGoBack();
    if (ref.watch(loginProvider).accessToken != '' && canGoBack) {
      String pdfUrl = change.replaceFirst('epdf', 'pdf');
      Uri downloadLink = acpArticle.replace(queryParameters: {
        'idpCode': 'acp',
        'token': ref.read(loginProvider).accessToken,
        'redirectUri': pdfUrl
      });
      launchUrl(downloadLink, mode: LaunchMode.externalNonBrowserApplication);
    } else {
      final directory = await getApplicationDocumentsDirectory();
      F.appFlavor == Flavor.aimcc
          ? launchUrl(Uri.parse(change))
          : await FlutterDownloader.enqueue(
              url: change,
              headers: {'User-agent': "${DateTime.now()}"},
              savedDir: directory.absolute.path,
              showNotification: true,
              openFileFromNotification: true,
              saveInPublicStorage: true,
            );
    }
  }

  static (
    PlatformWebViewControllerCreationParams,
    PlatformNavigationDelegateCreationParams
  ) initController() {
    PlatformWebViewControllerCreationParams params =
        const PlatformWebViewControllerCreationParams();
    PlatformNavigationDelegateCreationParams navigationDelegateCreationParams =
        const PlatformNavigationDelegateCreationParams();

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams
          .fromPlatformWebViewControllerCreationParams(params);
      navigationDelegateCreationParams = WebKitNavigationDelegateCreationParams
          .fromPlatformNavigationDelegateCreationParams(
              navigationDelegateCreationParams);
    } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      params = AndroidWebViewControllerCreationParams
          .fromPlatformWebViewControllerCreationParams(params);
      navigationDelegateCreationParams = AndroidNavigationDelegateCreationParams
          .fromPlatformNavigationDelegateCreationParams(
              navigationDelegateCreationParams);
    }
    return (params, navigationDelegateCreationParams);
  }

  Future<bool> fetchNotConnected() async {
    final String? html = await DataRepository().getHtml(widget.articleItem);
    if (html == null) {
      return false;
    } else {
      if (!mounted) return false;
      webViewController.loadHtmlString(html,
          baseUrl: "https://www.acpjournals.org/");
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.backButtonHandler
        ? PopScope(
            canPop: false,
            onPopInvoked: (didPop) => (didPop && !Navigator.canPop(context))
                ? SystemNavigator.pop(animated: true)
                : null,
            child: articleWebViewWidget(context),
          )
        : articleWebViewWidget(context);
  }

  Scaffold articleWebViewWidget(BuildContext context) {
    return Scaffold(
        appBar: !widget.addAppBar
            ? null
            : AppBar(
                automaticallyImplyLeading: false,
                leading: Semantics(
                  label: 'back button double tap to activate',
                  excludeSemantics: true,
                  child: IconButton(
                      color: CustomThemes().gettheme().whitecolor,
                      onPressed: () => Navigator.pop(context),
                      icon: Semantics(
                          label: "Back Button",
                          child: ExcludeSemantics(
                              child: ImageIcon(AssetImage(
                                  CustomThemes().gettheme().leftarrow))))),
                ),
                backgroundColor: CustomThemes().gettheme().bgColor,
                actions: [
                  StreamBuilder<bool>(
                    stream: ConnectivityStatus().connection,
                    builder: (context, snapshot) {
                      return Visibility(
                        visible: snapshot.hasData && snapshot.data == true,
                        child: Semantics(
                          label:
                              'social media share button double tap to activate',
                          excludeSemantics: true,
                          child: Builder(
                            builder: (context) => IconButton(
                              iconSize: 26,
                              onPressed: () => SocialShare().onShareText(
                                  context: context,
                                  text: widget.articleItem['link']),
                              icon: Semantics(
                                  label: "Social Media Share Button",
                                  child: const ExcludeSemantics(
                                      child: Icon(Icons.share))),
                              color: CustomThemes().gettheme().whitecolor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
        body: StreamBuilder<bool>(
            stream: ConnectivityStatus().connection,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator(
                    color: CustomThemes().gettheme().bgColor, minHeight: 3);
              } else if (snapshot.hasData) {
                if (snapshot.data == true && mounted) {
                  webViewController.loadRequest(acpArticle);
                  return Consumer(builder: (context, ref, child) {
                    return articleWebView(ref.watch(loadingProvider));
                  });
                } else {
                  return FutureBuilder(
                      future: fetchNotConnected(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return LinearProgressIndicator(
                              color: CustomThemes().gettheme().bgColor,
                              minHeight: 3);
                        } else if (snapshot.hasData) {
                          if (snapshot.data == false) {
                            return const ErrorScreen(
                                errorCode: 404, isHeader: false);
                          } else {
                            return Consumer(builder: (context, ref, child) {
                              return articleWebView(ref.watch(loadingProvider));
                            });
                          }
                        } else {
                          return const ErrorScreen(
                              errorCode: 404, isHeader: false);
                        }
                      });
                }
              } else {
                return const ErrorScreen(errorCode: 404, isHeader: false);
              }
            }),
        floatingActionButton: !widget.addMagnifierButton
            ? null
            : Consumer(builder: (context, ref, child) {
                final value = !ref.watch(valueProvider);
                return Offstage(
                  offstage: value,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 570.0,
                        right: 0.0,
                        child: SizedBox(
                          width: 100,
                          height: 45,
                          child: Stack(
                            children: [
                              Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(20.0),
                                color: CustomThemes().gettheme().whitecolor,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 2.0, 10.0, 10.0),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _zoomOut();
                                            });
                                          },
                                          icon: Icon(
                                            Icons.zoom_out,
                                            color:
                                                CustomThemes().gettheme().black,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _zoomIn();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.zoom_in,
                                    color: CustomThemes().gettheme().black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }));
  }

  Widget articleWebView(int loadingPercent) {
    return Stack(
      children: [
        Transform.scale(
          scale: _scale,
          child: WebViewWidget(controller: webViewController),
        ),
        Visibility(
          visible: loadingPercent > 0 && loadingPercent < 100,
          child: LinearProgressIndicator(
            color: CustomThemes().gettheme().bgColor,
            minHeight: 3,
            value: loadingPercent / 100,
          ),
        ),
      ],
    );
  }
}
