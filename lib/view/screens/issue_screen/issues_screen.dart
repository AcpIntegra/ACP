// import 'dart:developer';
// import 'dart:io';
// import 'dart:isolate';

// import 'package:acp_app/main/config.dart';
// import 'package:acp_app/view/screens/article_screen/article_webview.dart';
// import 'package:acp_app/view/screens/error_screen/error_page.dart';
// import 'package:acp_app/view/view_utils/readmore.dart';
// import 'package:acp_app/view/view_utils/themes.dart';
// import 'package:acp_app/view/widgets/rounded_text_container.dart';
// import 'package:acp_app/view/widgets/secondary_appbar.dart';
// import 'package:acp_app/view_model/providers/article_provider.dart';
// import 'package:acp_app/view_model/providers/currentissue_provider.dart';
// import 'package:acp_app/view_model/providers/darkmode_provider.dart';
// import 'package:acp_app/view_model/providers/font_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:path_provider/path_provider.dart';

// class IssuePage extends ConsumerStatefulWidget {
//   const IssuePage({super.key});

//   @override
//   ConsumerState<IssuePage> createState() => _IssuesPagePageState();
// }

// class _IssuesPagePageState extends ConsumerState<IssuePage> {
//   bool playerestart = false;
//   String base64Image = '';
//   final port = ReceivePort();
//   int isBookmarked = 1;
//   int free = 1;
//   bool bookmark = false;
//   late List<Map<String, dynamic>> channalArticles = [];
//   @override
//   void initState() {
//     Config().bindBackgroundIsolate(port);
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     bool snackbarCompleted = true;
//     port.listen((message) {
//       message[2] == 100 && snackbarCompleted
//           ? WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//               snackbarCompleted = false;
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Download Completed'),
//                   duration: Duration(seconds: 2),
//                 ),
//               );
//             })
//           : message[2] == -1 && snackbarCompleted
//               ? WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//                   snackbarCompleted = false;
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Download failed'),
//                       duration: Duration(seconds: 2),
//                     ),
//                   );
//                 })
//               : null;
//     });
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     Config().unbindBackgroundIsolate();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AsyncValue<List<Map<String, dynamic>>> article =
//         ref.watch(currentIssueArticlesProvider);
//     ref.watch(fontProvider.notifier).loadDefaultFonts();
//     double activeFont = ref.watch(fontProvider).size;
//     final bool isDark = ref.watch(darkModeProvider);
//     return Semantics(
//         label:
//             'Current Issue Screen', // Provide a meaningful label for the screen
//         child: Scaffold(
//           appBar: const SecondaryAppBar(title: "Current Issues"),
//           body: article.when(
//               data: (list) => list.isEmpty
//                   ? Text(
//                       "No article found",
//                       style: TextStyle(
//                         fontSize: 16 * activeFont,
//                         fontWeight: FontWeight.bold,
//                         color: isDark
//                             ? CustomThemes().gettheme().whitecolor
//                             : CustomThemes().gettheme().bgColor,
//                       ),
//                     )
//                   : ListView(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 7, 10, 10),
//                           child: carouselContainer(
//                               isDark,
//                               ref
//                                   .watch(currentIssueArticlesProvider.notifier)
//                                   .channelArticles[0],
//                               ref
//                                   .read(currentIssueArticlesProvider.notifier)
//                                   .player,
//                               ref
//                                   .read(currentIssueArticlesProvider.notifier)
//                                   .player2,
//                               ref
//                                   .read(currentIssueArticlesProvider.notifier)
//                                   .isPresentFirstAudio,
//                               ref
//                                   .read(currentIssueArticlesProvider.notifier)
//                                   .isPresentSecondAudio,
//                               ref
//                                   .read(currentIssueArticlesProvider.notifier)
//                                   .podCastAudio1,
//                               ref
//                                   .read(currentIssueArticlesProvider.notifier)
//                                   .podCastAudio2,
//                               list[0],
//                               activeFont,
//                               base64Image,
//                               context),
//                         ),
//                         for (Map<String, dynamic> item in list)
//                           Padding(
//                               padding: const EdgeInsets.fromLTRB(15, 4, 10, 10),
//                               child: GestureDetector(
//                                   onTap: () => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => ArticleWebView(
//                                               articleItem: item))),
//                                   child: currentIssueContainer(
//                                       context, item, ref, activeFont))),
//                       ],
//                     ),
//               error: (error, stackTrace) =>
//                   const ErrorScreen(errorCode: 404, isHeader: false),
//               loading: () =>
//                   const Center(child: CircularProgressIndicator.adaptive())),
//         ));
//   }
// }

// Widget currentIssueContainer(
//     BuildContext context, index, WidgetRef ref, double fontSizeFactor) {
//   final isIpad =
//       Platform.isIOS && MediaQuery.of(context).size.shortestSide >= 600;
//   final AllCurrentIssueArticleNotifer allArticleNotifer =
//       ref.read(currentIssueArticlesProvider.notifier);
//   final bool isDark = ref.watch(darkModeProvider);
//   double activeFont = ref.watch(fontProvider).size;
//   return Container(
//       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//       decoration: BoxDecoration(
//         color: isDark
//             ? CustomThemes().gettheme().darkmodegrey
//             : CustomThemes()
//                 .gettheme()
//                 .whitecolor, // Set the background color to white
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: isDark
//             ? null
//             : [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset:
//                       const Offset(0, 3), // changes the position of the shadow
//                 ),
//               ],
//       ),
//       child: Column(
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//             Flexible(
//               child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Semantics(
//                     excludeSemantics: true,
//                     label: "title : ${index['title'].toString()}",
//                     child: Text(
//                       index['title'].toString().isEmpty
//                           ? ""
//                           : index['title'].toString(),
//                       style: TextStyle(
//                           fontSize: 15 * fontSizeFactor,
//                           fontWeight: FontWeight.bold,
//                           color: isDark
//                               ? CustomThemes().gettheme().whitecolor
//                               : CustomThemes().gettheme().black,
//                           fontFamily: CustomThemes().gettheme().font1),
//                     ),
//                   )),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(2),
//                 child: FocusScope(
//                   child: index['isFree'] == 1
//                       ? Semantics(
//                           excludeSemantics: true,
//                           label: 'free article',
//                           child: const RoundedTextContainer(text: 'Free'))
//                       : Container(),
//                 )),
//             FocusScope(
//               child: Semantics.fromProperties(
//                 excludeSemantics: true,
//                 properties: index['is_bookmarked'] == 1
//                     ? const SemanticsProperties(
//                         label: 'Remove bookmark Double tap to activate')
//                     : const SemanticsProperties(
//                         label: 'Add bookmark Double tap to activate'),
//                 child: GestureDetector(
//                   onTap: () async {
//                     await AnalyticsService.userInteractionTrack();
//                     await allArticleNotifer.updateBookMark(index);
//                     await ref
//                         .read(allArticlesProvider.notifier)
//                         .updateArticles();
//                     if (index['is_bookmarked'] == 1) {
//                       // ignore: use_build_context_synchronously
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Bookmark removed'),
//                           duration: Duration(seconds: 2),
//                         ),
//                       );
//                     } else {
//                       // ignore: use_build_context_synchronously
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Bookmark added'),
//                           duration: Duration(seconds: 2),
//                         ),
//                       );
//                     }
//                   },
//                   child: index['is_bookmarked'] == 1
//                       ? Icon(Icons.bookmark_added,
//                           size: 28,
//                           color: isDark
//                               ? CustomThemes().gettheme().whitecolor
//                               : CustomThemes().gettheme().bgColor)
//                       : Icon(Icons.bookmark_add_outlined,
//                           size: 28,
//                           color: isDark
//                               ? CustomThemes().gettheme().whitecolor
//                               : CustomThemes().gettheme().bgColor),
//                 ),
//               ),
//             ),
//           ]),
//           if (index['author'].toString().isNotEmpty)
//             Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Semantics(
//                       excludeSemantics: true,
//                       label: "author : ${index['author'].toString()}",
//                       child: Text(
//                         index['author'].toString(),
//                         style: TextStyle(
//                             fontStyle: FontStyle.italic,
//                             fontSize: 12 * activeFont,
//                             fontFamily: CustomThemes().gettheme().font2,
//                             fontWeight: FontWeight.w400,
//                             color: isDark
//                                 ? CustomThemes().gettheme().whitecolor
//                                 : CustomThemes().gettheme().black),
//                       ),
//                     ))),
//           if (index['description'].toString().isNotEmpty)
//             Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Semantics(
//                     excludeSemantics: true,
//                     label: "description : ${index['description'].toString()}",
//                     child: index['description'].toString().length > 200 &&
//                             !isIpad
//                         ? ReadMoreText(
//                             text: index['description'].toString(),
//                             maxLines:
//                                 3, // Adjust the number of lines to display initially
//                             style: TextStyle(
//                               fontSize: 12 * activeFont,
//                               fontFamily: CustomThemes().gettheme().font2,
//                               color: isDark
//                                   ? CustomThemes().gettheme().whitecolor
//                                   : CustomThemes().gettheme().blackgrayshadow,
//                             ),
//                           )
//                         : Semantics(
//                             excludeSemantics: true,
//                             label:
//                                 "description : ${index['description'].toString()}",
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 index['description'].toString(),
//                                 style: TextStyle(
//                                   fontSize: 12 * fontSizeFactor,
//                                   fontFamily: CustomThemes().gettheme().font2,
//                                   color: isDark
//                                       ? CustomThemes().gettheme().whitecolor
//                                       : CustomThemes()
//                                           .gettheme()
//                                           .blackgrayshadow,
//                                 ),
//                               ),
//                             ),
//                           ))),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(2, 10, 5, 0),
//             child: Row(
//               children: [
//                 if (index['type'].toString().isNotEmpty)
//                   FittedBox(
//                     fit: BoxFit.scaleDown,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: isDark
//                             ? CustomThemes().gettheme().whitecolor
//                             : CustomThemes().gettheme().typedarkbgcolor,
//                         borderRadius: BorderRadius.circular(26),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       constraints: const BoxConstraints(
//                         minWidth: 20,
//                         minHeight: 30,
//                       ),
//                       child: Flex(direction: Axis.horizontal, children: [
//                         Semantics(
//                           excludeSemantics: true,
//                           label: "Type : ${index['type'].toString()}",
//                           child: Text(
//                             index['type'].toString().isEmpty
//                                 ? ""
//                                 : index['type'].toString().length >= 18
//                                     ? '${index['type'].toString().substring(0, 18)}... '
//                                     : index['type'].toString(),
//                             style: TextStyle(
//                               color: isDark
//                                   ? CustomThemes().gettheme().darkmodeblack
//                                   : CustomThemes().gettheme().whitecolor,
//                               fontFamily: CustomThemes().gettheme().font2,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 13 * activeFont,
//                             ),
//                           ),
//                         )
//                       ]),
//                     ),
//                   ),
//                 const Spacer(),
//                 if (index['type'].toString().isNotEmpty &&
//                     index['type'].toString().length <= 19)
//                   Padding(
//                       padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
//                       child: Semantics(
//                           excludeSemantics: true,
//                           label:
//                               "published date : ${index['pubDate'].toString()}",
//                           child: Text(
//                               index['pubDate'].toString().isEmpty
//                                   ? ""
//                                   : index['pubDate'].toString(),
//                               style: TextStyle(
//                                 fontSize: 13 * activeFont,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: CustomThemes().gettheme().font2,
//                                 color: isDark
//                                     ? CustomThemes().gettheme().whitecolor
//                                     : CustomThemes().gettheme().blackgrayshadow,
//                               )))),
//                 if (index['type'].toString().isNotEmpty &&
//                     index['type'].toString().length <= 19)
//                   FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Padding(
//                           padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
//                           child: Icon(
//                             Icons.access_time,
//                             color: isDark
//                                 ? CustomThemes().gettheme().whitecolor
//                                 : CustomThemes().gettheme().blackgrayshadow,
//                           )))
//               ],
//             ),
//           )
//         ],
//       ));
// }

// Widget carouselContainer(bool isDark, index, player, player2, isPresenturlone,
//     isPresenturltwo, audio1, audio2, valume, activeFont, base64Image, context) {
//   String year = index['pubDate'].toString().substring(0, 4);
//   String month = index['pubDate'].toString().substring(4, 6);

//   double responsiveWidth(double value) {
//     return MediaQuery.of(context).size.width * (value / 375);
//   }

//   String getMonthName(int monthNumber) {
//     switch (monthNumber) {
//       case 1:
//         return "January";
//       case 2:
//         return "February";
//       case 3:
//         return "March";
//       case 4:
//         return "April";
//       case 5:
//         return "May";
//       case 6:
//         return "June";
//       case 7:
//         return "July";
//       case 8:
//         return "August";
//       case 9:
//         return "September";
//       case 10:
//         return "October";
//       case 11:
//         return "November";
//       case 12:
//         return "December";
//       default:
//         return "Invalid month";
//     }
//   }

//   String datebind = "${getMonthName(int.parse(month))} $year";
//   // String url =
//   //     'https://www.acpjournals.org/pb-assets/audio/annals_20240206.mp3';
//   Future<void> downloadAudio(String url) async {
//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final taskId = await FlutterDownloader.enqueue(
//         url: url,
//         savedDir: directory.absolute.path,
//         showNotification: true,
//         openFileFromNotification: true,
//         saveInPublicStorage: true,
//       );

//       log('Download task id: $taskId');
//     } catch (error) {
//       log('Failed to start download: $error');
//     }
//   }

//   return Container(
//       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//       decoration: BoxDecoration(
//         color: isDark
//             ? CustomThemes().gettheme().black
//             : CustomThemes()
//                 .gettheme()
//                 .whitecolor, // Set the background color to white
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: isDark
//                 ? CustomThemes().gettheme().black
//                 : Colors.grey.withOpacity(0.2),
//             spreadRadius: isDark ? 0 : 5,
//             blurRadius: isDark ? 0 : 7,
//             offset: isDark
//                 ? const Offset(0, 0)
//                 : const Offset(0, 3), // changes the position of the shadow
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Padding(
//               padding: EdgeInsets.zero,
//               child: Row(children: [
//                 Flexible(
//                     child: Text(
//                         valume['voliss'].toString().isEmpty &&
//                                 valume['voliss'] == null
//                             ? ""
//                             : "$datebind - ${valume['voliss']}",
//                         style: TextStyle(
//                             fontSize: 18.0 * activeFont,
//                             fontWeight: FontWeight.bold,
//                             color: isDark
//                                 ? CustomThemes().gettheme().whitecolor
//                                 : CustomThemes().gettheme().black,
//                             fontFamily: CustomThemes().gettheme().font1)))
//               ])),
//           Padding(
//               padding: EdgeInsets.zero,
//               child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                 Flexible(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 5),
//                     child: Text(
//                       "$datebind  ${index['title']}".toUpperCase(),
//                       style: TextStyle(
//                           fontSize: 14.0 * activeFont,
//                           fontWeight: FontWeight.bold,
//                           color: isDark
//                               ? CustomThemes().gettheme().whitecolor
//                               : CustomThemes().gettheme().bgColor,
//                           fontFamily: CustomThemes().gettheme().font2),
//                     ),
//                   ),
//                 ),
//               ])),
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: LayoutBuilder(builder: (context, constraints) {
//               return Row(children: [
//                 Semantics(
//                     label: "Preview of current issue Cover Image",
//                     child: const ExcludeSemantics(
//                         child: Image(
//                       image: AssetImage("asset/image/currentimage.png"),
//                       height: 260,
//                     ))),
//               ]);
//             }),
//           ),
//           Padding(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'LATEST HIGHLIGHTS',
//                     style: TextStyle(
//                       color: isDark
//                           ? CustomThemes().gettheme().whitecolor
//                           : CustomThemes()
//                               .gettheme()
//                               .bgColor, // Set your desired text color
//                       fontSize: 14.0 * activeFont, // Set your desired font size
//                       fontWeight:
//                           FontWeight.bold, // Set your desired font weight
//                       // You can add more styling properties as needed
//                     ),
//                   ))),
//           if (isPresenturlone)
//             Padding(
//               padding: const EdgeInsets.only(left: 5),
//               child: Row(
//                 children: [
//                   Container(
//                       width: responsiveWidth(265),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                             30), // Adjust the radius as needed
//                         color: isDark
//                             ? CustomThemes().gettheme().activethemecolordark
//                             : CustomThemes().gettheme().greybackground,
//                       ),
//                       child: Row(
//                         children: [
//                           StreamBuilder<Duration>(
//                             stream: player.positionStream,
//                             builder: (context, snapshot) {
//                               final position = snapshot.data ?? Duration.zero;
//                               final duration = player.duration ?? Duration.zero;
//                               return Row(
//                                 children: [
//                                   Center(
//                                     child: Semantics(
//                                       label: 'Audio play button',
//                                       child: GestureDetector(
//                                         onTap: () async {
//                                           await AnalyticsService
//                                               .userInteractionTrack();
//                                           if (player.playing) {
//                                             player.pause();
//                                           } else {
//                                             player.play();
//                                             player2.pause();
//                                           }
//                                         },
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 13),
//                                           child: FocusScope(
//                                             child: Semantics(
//                                               label: player.playing
//                                                   ? 'Podcast 1 pause button Double tap to activate'
//                                                   : 'Podcast 1 play button Double tap to activate',
//                                               excludeSemantics: true,
//                                               child: Icon(
//                                                 player.playing
//                                                     ? Icons.pause
//                                                     : Icons.play_arrow,
//                                                 size: 26,
//                                                 color: isDark
//                                                     ? CustomThemes()
//                                                         .gettheme()
//                                                         .whitecolor
//                                                     : CustomThemes()
//                                                         .gettheme()
//                                                         .black,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   ExcludeSemantics(
//                                     child: SizedBox(
//                                       width: responsiveWidth(
//                                           130), // Set your desired width here
//                                       child: Slider(
//                                           value: position.inMilliseconds
//                                               .toDouble(),
//                                           min: 0.0,
//                                           max: duration.inMilliseconds
//                                               .toDouble(),
//                                           onChanged: (value) {},
//                                           activeColor: isDark
//                                               ? CustomThemes()
//                                                   .gettheme()
//                                                   .whitecolor
//                                               : CustomThemes().gettheme().black,
//                                           inactiveColor: !isDark
//                                               ? CustomThemes()
//                                                   .gettheme()
//                                                   .sliderinactivelightcolor
//                                               : CustomThemes()
//                                                   .gettheme()
//                                                   .blackgrayshadow),
//                                     ),
//                                   ),
//                                   Text(
//                                     '${(position.inMinutes % 60).toString().padLeft(2, '0')}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
//                                     style: TextStyle(
//                                         fontSize: 12.0,
//                                         color: isDark
//                                             ? CustomThemes()
//                                                 .gettheme()
//                                                 .whitecolor
//                                             : CustomThemes().gettheme().black),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ],
//                       )),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 0),
//                     child: FocusScope(
//                       child: Semantics(
//                         excludeSemantics: true,
//                         label:
//                             'Podcast 1 Download button Double tap to activate',
//                         child: IconButton(
//                           icon: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: isDark
//                                     ? CustomThemes().gettheme().whitecolor
//                                     : CustomThemes()
//                                         .gettheme()
//                                         .bgColor, // Set your desired background color
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'asset/image/icons/dowload.png', // Set your image asset path
//                                   width: 20, // Set your desired width
//                                   height: 20, // Set your desired height
//                                   color: isDark
//                                       ? CustomThemes().gettheme().black
//                                       : CustomThemes()
//                                           .gettheme()
//                                           .whitecolor, // Set your desired image color
//                                 ),
//                               )),
//                           onPressed: () async {
//                             downloadAudio(audio1);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Download Started'),
//                                 duration: Duration(seconds: 2),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           if (isPresenturltwo)
//             Divider(color: CustomThemes().gettheme().greybackground),
//           if (isPresenturltwo)
//             Padding(
//               padding: const EdgeInsets.only(left: 5),
//               child: Row(
//                 children: [
//                   Container(
//                       width: responsiveWidth(264),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                             30), // Adjust the radius as needed
//                         color: isDark
//                             ? CustomThemes().gettheme().activethemecolordark
//                             : CustomThemes().gettheme().greybackground,
//                       ),
//                       child: Row(
//                         children: [
//                           StreamBuilder<Duration>(
//                             stream: player2.positionStream,
//                             builder: (context, snapshot) {
//                               final positions = snapshot.data ?? Duration.zero;
//                               final durations =
//                                   player2.duration ?? Duration.zero;
//                               return Row(
//                                 children: [
//                                   Semantics(
//                                     label: 'Audio play button',
//                                     child: GestureDetector(
//                                       onTap: () async {
//                                         await AnalyticsService
//                                             .userInteractionTrack();
//                                         if (player2.playing) {
//                                           player2.pause();
//                                         } else {
//                                           player2.play();
//                                           player.pause();
//                                         }
//                                       },
//                                       child: Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 13),
//                                         child: FocusScope(
//                                           child: Semantics(
//                                             label: player2.playing
//                                                 ? 'Podcast 2 pause button Double tap to activate'
//                                                 : 'Podcast 2 play button Double tap to activate',
//                                             child: Icon(
//                                               player2.playing
//                                                   ? Icons.pause
//                                                   : Icons.play_arrow,
//                                               size: 26,
//                                               color: isDark
//                                                   ? CustomThemes()
//                                                       .gettheme()
//                                                       .whitecolor
//                                                   : CustomThemes()
//                                                       .gettheme()
//                                                       .black,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   ExcludeSemantics(
//                                     child: SizedBox(
//                                       width: responsiveWidth(
//                                           130), // Set your desired width here
//                                       child: Slider(
//                                           value: positions.inMilliseconds
//                                               .toDouble(),
//                                           min: 0.0,
//                                           max: durations.inMilliseconds
//                                               .toDouble(),
//                                           onChanged: (value) {},
//                                           activeColor: isDark
//                                               ? CustomThemes()
//                                                   .gettheme()
//                                                   .whitecolor
//                                               : CustomThemes().gettheme().black,
//                                           inactiveColor: !isDark
//                                               ? CustomThemes()
//                                                   .gettheme()
//                                                   .sliderinactivelightcolor
//                                               : CustomThemes()
//                                                   .gettheme()
//                                                   .blackgrayshadow),
//                                     ),
//                                   ),
//                                   Text(
//                                     '${(positions.inMinutes % 60).toString().padLeft(2, '0')}:${(positions.inSeconds % 60).toString().padLeft(2, '0')} / ${(durations.inMinutes % 60).toString().padLeft(2, '0')}:${(durations.inSeconds % 60).toString().padLeft(2, '0')}',
//                                     style: TextStyle(
//                                         fontSize: 12.0,
//                                         color: isDark
//                                             ? CustomThemes()
//                                                 .gettheme()
//                                                 .whitecolor
//                                             : CustomThemes().gettheme().black),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ],
//                       )),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 0),
//                       child: FocusScope(
//                         child: Semantics(
//                           excludeSemantics: true,
//                           label:
//                               'Podcast 2 Download button Double tap to activate',
//                           child: IconButton(
//                             icon: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: isDark
//                                     ? CustomThemes().gettheme().whitecolor
//                                     : CustomThemes().gettheme().bgColor,
//                                 // Set your desired background color
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Image.asset(
//                                   'asset/image/icons/dowload.png', // Set your image asset path
//                                   width: 20, // Set your desired width
//                                   height: 20, // Set your desired height
//                                   color: isDark
//                                       ? CustomThemes().gettheme().black
//                                       : CustomThemes()
//                                           .gettheme()
//                                           .whitecolor, // Set your desired image color
//                                 ),
//                               ),
//                             ),
//                             onPressed: () async {
//                               downloadAudio(audio2);
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Download Started'),
//                                   duration: Duration(seconds: 2),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//         ],
//       ));
// }
