part of '../article_screen/article_webview.dart';

class GuidelineWebView extends ConsumerStatefulWidget {
  const GuidelineWebView({super.key, required this.issue});

  final GuideLinesIssue issue;

  @override
  ConsumerState<GuidelineWebView> createState() => GuidelineWebViewState();
}

class GuidelineWebViewState extends ConsumerState<GuidelineWebView>
    with SingleTickerProviderStateMixin {
  final port = ReceivePort();
  late TabController animationController;
  late PageController pageController;
  Queue<int> stack = Queue<int>();
  int length = 0;

  @override
  void initState() {
    if (!mounted) return;
    Config().bindBackgroundIsolate(port);
    animationController = TabController(
        vsync: this, length: widget.issue.recommendationList.length);
    super.initState();
  }

  void animationCallback() {
    if (!animationController.indexIsChanging) {
      stack.add(animationController.previousIndex);
      log("from webview => ${stack.toString()}  ${animationController.indexIsChanging.toString()}");
    }
  }

  @override
  void didChangeDependencies() {
    animationController.animation!.addListener(() {
      ref
          .watch(guidelineSliderValueProvider.notifier)
          .changeValue(animationController.animation!.value);
    });
    animationController.addListener(animationCallback);
    port.listen(
      (message) async {
        var taskId = message[0];
        final tasks = await FlutterDownloader.loadTasksWithRawQuery(
            query: '''SELECT * FROM task WHERE task_id="$taskId"''');
        DownloadTask? task = tasks?[0];
        if (task != null &&
            ((task.status == DownloadTaskStatus.failed ||
                    task.status == DownloadTaskStatus.canceled ||
                    task.progress <= -1) &&
                context.mounted &&
                mounted)) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Scaffold(
                        body: ArticleWebView(
                          articleItem: {
                            'link': 'https://www.acpjournals.org/doi/',
                            'id': '404',
                          },
                          backButtonHandler: false,
                          enableDownload: false,
                          addAppBar: true,
                          addMagnifierButton: false,
                        ),
                      )));
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Config().unbindBackgroundIsolate();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = ref.watch(darkModeProvider);
    double activeFont = ref.watch(fontProvider).size;
    return Scaffold(
        appBar: AppBar(
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
                        child: ImageIcon(
                            AssetImage(CustomThemes().gettheme().leftarrow))))),
          ),
          backgroundColor: CustomThemes().gettheme().bgColor,
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  label: 'social media share button double tap to activate',
                  excludeSemantics: true,
                  child: Builder(
                    builder: (context) => IconButton(
                      iconSize: 26,
                      onPressed: () => SocialShare().onShareText(
                          context: context, text: widget.issue.url),
                      icon: Semantics(
                          label: "Social Media Share Button",
                          child:
                              const ExcludeSemantics(child: Icon(Icons.share))),
                      color: CustomThemes().gettheme().whitecolor,
                    ),
                  ),
                ),
                Semantics(
                  label: 'PDF of article Double tap to Download',
                  excludeSemantics: true,
                  child: IconButton(
                      onPressed: () async {
                        bool isConnected =
                            await ConnectivityStatus().checkConnection();

                        Fluttertoast.showToast(
                            msg: "Download Started...",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor:
                                const Color.fromARGB(255, 105, 102, 102),
                            textColor: Colors.white,
                            fontSize: 16.0);
                        (isConnected)
                            ? await FlutterDownloader.enqueue(
                                headers: {"User-Agent": "${DateTime.now()}"},
                                url: widget.issue.pdfUrl,
                                savedDir: Config().downloadPath,
                                saveInPublicStorage: true)
                            : null;
                      },
                      icon: const Icon(Icons.picture_as_pdf),
                      color: CustomThemes().gettheme().whitecolor),
                ),
                Semantics(
                    label: 'TOC double tap to open',
                    excludeSemantics: true,
                    child: IconButton(
                        onPressed: () {
                          NavigatorCallback.showDialogBox(
                              context: context,
                              child: GuidelineRecommendationsPage(
                                  tabController: animationController,
                                  recommendationList:
                                      widget.issue.recommendationList));
                        },
                        icon: Icon(Icons.list,
                            color: CustomThemes().gettheme().whitecolor))),
              ],
            )
          ],
        ),
        body: FocusScope(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: isDark
                        ? CustomThemes().gettheme().inactivethemecolordark
                        : Colors.white),
                child: Text(
                  widget.issue.group,
                  style: TextStyle(
                      fontSize: 14 * activeFont,
                      color: isDark
                          ? Colors.white
                          : CustomThemes().gettheme().bgColor),
                )),
            Expanded(
              child: TabBarView(
                controller: animationController,
                children: widget.issue.recommendationList
                    .map((e) => Transform.scale(
                        scale: ref.watch(guidelineWebviewScaleProvider),
                        child: RecommendationWidget(
                          htmlDocument: e.htmlDocument,
                          url: widget.issue.url,
                        )))
                    .toList(),
              ),
            ),
            Consumer(builder: (context, ref, child) {
              bool isDark = ref.read(darkModeProvider);
              return Container(
                color: isDark
                    ? CustomThemes().gettheme().inactivethemecolordark
                    : CustomThemes().gettheme().whitecolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Page ${ref.watch(guidelineSliderValueProvider.notifier).index + 1}",
                      style: TextStyle(
                          color: isDark
                              ? CustomThemes().gettheme().whitecolor
                              : CustomThemes().gettheme().bgColor),
                    ),
                    Slider(
                        activeColor: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().bgColor,
                        inactiveColor: isDark
                            ? Colors.black
                            : CustomThemes()
                                .gettheme()
                                .sliderinactivelightcolor,
                        semanticFormatterCallback: (value) =>
                            "Page number ${value.floor() + 1}, title is ${widget.issue.recommendationList[value.floor()].title}",
                        thumbColor: isDark
                            ? CustomThemes().gettheme().whitecolor
                            : CustomThemes().gettheme().bgColor,
                        divisions: widget.issue.recommendationList.length - 1,
                        value: ref.watch(guidelineSliderValueProvider),
                        max: widget.issue.recommendationList.length.toDouble() -
                            1,
                        onChangeStart: (value) {},
                        onChanged: (value) {
                          ref
                              .watch(guidelineSliderValueProvider.notifier)
                              .changeValue(value);
                          animationController.animateTo(value.floor());
                        }),
                    Text("Page ${widget.issue.recommendationList.length}")
                  ],
                ),
              );
            })
          ],
        )),
        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 55),
          child: MagnifierButton(
            onTapZoomOut: () => ref
                .watch(guidelineWebviewScaleProvider.notifier)
                .decreaseScale(),
            onTapZoomIn: () => ref
                .watch(guidelineWebviewScaleProvider.notifier)
                .increaseScale(),
          ),
        ));
  }
}

class RecommendationWidget extends ConsumerStatefulWidget {
  const RecommendationWidget(
      {super.key, required this.htmlDocument, required this.url});
  final dom.Document htmlDocument;
  final String url;
  @override
  ConsumerState<RecommendationWidget> createState() =>
      _RecommendationWidgetState();
}

class _RecommendationWidgetState extends ConsumerState<RecommendationWidget>
    with AutomaticKeepAliveClientMixin {
  late final WebViewController webViewController;
  late final PlatformNavigationDelegateCreationParams
      navigationDelegateCreationParams;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  NavigationDelegate navigationDelegate(
      PlatformNavigationDelegateCreationParams
          navigationDelegateCreationParams) {
    bool firstTime = true;
    return NavigationDelegate.fromPlatformCreationParams(
        navigationDelegateCreationParams,
        onProgress: (progress) {
          ref.watch(loadingProvider.notifier).changeLoadingPercent(progress);
        },
        onPageStarted: (url) =>
            ref.watch(loadingProvider.notifier).changeLoadingPercent(0),
        onPageFinished: (url) =>
            ref.watch(loadingProvider.notifier).changeLoadingPercent(100),
        onNavigationRequest: (request) {
          if (firstTime && Platform.isIOS) {
            firstTime = false;
            return NavigationDecision.navigate;
          } else {
            _launchUrl(request.url);
            return NavigationDecision.prevent;
          }
        });
  }

  @override
  void initState() {
    (
      PlatformWebViewControllerCreationParams,
      PlatformNavigationDelegateCreationParams
    ) params = ArticleWebViewState.initController();
    navigationDelegateCreationParams = params.$2;

    webViewController = WebViewController.fromPlatformCreationParams(params.$1)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          navigationDelegate(navigationDelegateCreationParams))
      ..setBackgroundColor(Colors.transparent)
      ..enableZoom(true);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final activeFont = ref.read(fontProvider).title;
    List<dom.Element> htmlelement =
        widget.htmlDocument.getElementsByTagName('html');
    List<dom.Element> attributes =
        widget.htmlDocument.getElementsByClassName("linkFullText");
    for (dom.Element element in attributes) {
      String? value = element.attributes['onclick'];
      if (value != null) {
        element.attributes['href'] =
            value.substring(value.indexOf("'") + 1, value.lastIndexOf("'"));
      }
    }

    String htmlClassName = "articleCt x-container x-html";

    switch (activeFont) {
      case 'Large':
        htmlClassName = "$htmlClassName large-fonts";

      case 'Medium':
        htmlClassName = "$htmlClassName medium-fonts";

      case 'Small':
        htmlClassName = "$htmlClassName small-fonts";

      default:
    }

    htmlelement.first.className = htmlClassName;
    widget.htmlDocument.body?.className = "x-body";
    widget.htmlDocument.head?.nodes.add(parseFragment(
        '<style>${cssFunction(ref.read(darkModeProvider))}</style>'));
    widget.htmlDocument.head?.append(
        parseFragment('''<meta name="viewport" content="initial-scale=1">'''));
    webViewController.loadHtmlString(widget.htmlDocument.outerHtml);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: [
        Consumer(builder: (context, ref, child) {
          final loadingPercent = ref.watch(loadingProvider);
          return Visibility(
              visible: loadingPercent > 0 && loadingPercent < 100,
              child: LinearProgressIndicator(
                color: CustomThemes().gettheme().bgColor,
                minHeight: 3,
                value: loadingPercent / 100,
              ));
        }),
        FocusScope(
          child: Semantics(
              header: false,
              child: WebViewWidget(
                  controller: webViewController,
                  gestureRecognizers: <Factory<VerticalDragGestureRecognizer>>{}
                    ..add(Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer())))),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
