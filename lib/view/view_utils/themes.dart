import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> themes = {
  "annals": {
    "bgcolor": "0xFF007376",
    "whitecolor": "0xFFffffff",
    "font1": "Oswald",
    "font2": "merriweather_sans",
    "logo": "asset/image/logo.png",
    "greybackground": "0xFFE7E8E9",
    "transparent": "0x00000000",
    "black": "0xFF333333",
    "blackgrayshadow": "0xFF565a5d",
    "blacksshadow1": "0xF575b5e",
    "yellow": "0xFFffc82f",
    "greenishgray": "0xFFd6e8e8",
    "collections": "asset/image/icons/components.png", //BottomNavigationBar
    "settings": "asset/image/icons/settings.png", //BottomNavigationBar
    "home": "asset/image/icons/latesthome.png", //BottomNavigationBar
    "multimedia": "asset/image/icons/multimedia.png", //BottomNavigationBar
    "issue": "asset/image/icons/issue.png", //BottomNavigationBar
    "headerlogo": "asset/image/headerlogo.png",
    "navigaionbarshadow": "0xFF575b5e",
    "acplogo2": "asset/image/icons/acplogo2.png",
    "acpicon": "asset/image/acpicon.png",
    "smallfont": "asset/image/icons/smallfont.png",
    "mediumfont": "asset/image/icons/mediumfont.png",
    "largefont": "asset/image/icons/largefont.png",
    "smallfontdark": "asset/image/icons/smallfontdark.png",
    "mediumfontdark": "asset/image/icons/mediumfontdark.png",
    "largefontdark": "asset/image/icons/largefontdark.png",
    "leftarrow": "asset/image/icons/leftarrow.png",
    "downarrow": "asset/image/icons/downarrow.png",
    "darkmodeblack": "0xFF1B1B1B",
    "darkmodegrey": "0xFF313131",
    "dividercolor": "0xFFE7E8E9",
    "typebgcolor": "0x33E7E8E9",
    "typedarkbgcolor": "0xFF575a5d",
    "hintcolorlight": "0xFF333333",
    "activethemecolordark": "0xFF545454",
    "inactivethemecolordark": "0xFF404040",
    "sliderinactivelightcolor": "0xFFCECFD1",
    "smallselected": "asset/image/icons/smallselected.png",
    "mediumselected": "asset/image/icons/mediumselected.png",
    "largeselected": "asset/image/icons/largeselected.png",
    "smalldarkselected": "asset/image/icons/smalldarkselected.png",
    "mediumdarkselected": "asset/image/icons/mediumdarkselected.png",
    "largedarkselected": "asset/image/icons/largedarkselected.png",
    "thumbColorSliderDarkGuideline": "0xFF545454",
    "fontsize1": "12",
    "fontsize2": "14",
    "fontsize3": "16",
    "fontsize4": "18",
    "fontsize5": "20",
    "ipadfontsize": "4"
  },
  "aimcc": {
    "bgcolor": "0xFF5F259F",
    "whitecolor": "0xFFffffff",
    "font1": "Oswald",
    "font2": "merriweather_sans",
    "logo": "asset/image/aimc.png",
    "acplogo2": "asset/image/icons/acplogo2.png",
    "headerlogo": "asset/image/aimc.png",
    "smallfont": "asset/image/icons/smallfontaimcc.png",
    "mediumfont": "asset/image/icons/mediumfontaimcc.png",
    "largefont": "asset/image/icons/largefontaimcc.png",
    "smallfontdark": "asset/image/icons/smallfontdark.png",
    "mediumfontdark": "asset/image/icons/mediumfontdark.png",
    "largefontdark": "asset/image/icons/largefontdark.png",
    "archivesicon": "asset/image/icons/archivesicon.png",
    "greybackground": "0xFFf5f5f5",
    "black": "0xFF333333",
    "blackgrayshadow": "0xFF565a5d",
    "blacksshadow1": "0xF575b5e",
    "yellow": "0xFFffc82f",
    "greenishgray": "0xFFe5dcef",
    "navigaionbarshadow": "0xFF575b5e",
    "transparent": "0x00000000",
    "leftarrow": "asset/image/icons/leftarrow.png",
    "downarrow": "asset/image/icons/downarrow.png",
    "acpicon": "asset/image/acpicon.png",
    "darkmodeblack": "0xFF1B1B1B",
    "darkmodegrey": "0xFF313131",
    "article": "asset/image/icons/article.png", //BottomNavigationBar
    "settings": "asset/image/icons/settings.png", //BottomNavigationBar
    "aimccbookmark":
        "asset/image/icons/aimccbookmark.png", //BottomNavigationBar
    "archives": "asset/image/icons/archives.png", //BottomNavigationBar
    "issue": "asset/image/icons/issue.png",
    "archiveheader": "asset/image/archiveheader.png",
    "inprogress": "asset/image/inprogress.png",
    "dividercolor": "0xFFE7E8E9",
    "typebgcolor": "0x33E7E8E9",
    "typedarkbgcolor": "0xFF575a5d",
    "hintcolorlight": "0xFF333333",
    "activethemecolordark": "0xFF545454",
    "inactivethemecolordark": "0xFF404040",
    "sliderinactivelightcolor": "0xFFCECFD1",
    "smallselected": "asset/image/icons/smallselectedaimcc.png",
    "mediumselected": "asset/image/icons/mediumselectedaimcc.png",
    "largeselected": "asset/image/icons/largeselectedaimcc.png",
    "smalldarkselected": "asset/image/icons/smalldarkselected.png",
    "mediumdarkselected": "asset/image/icons/mediumdarkselected.png",
    "largedarkselected": "asset/image/icons/largedarkselected.png",
    "thumbColorSliderDarkGuideline": "0xFF545454",
    "fontsize1": "12",
    "fontsize2": "14",
    "fontsize3": "16",
    "fontsize4": "18",
    "fontsize5": "20",
    "ipadfontsize": "4"
  },
  "acpcg": {
    "bgcolor": "0xFF007376",
    "whitecolor": "0xFFffffff",
    "font1": "Oswald",
    "font2": "merriweather_sans",
    "logo": "asset/image/cctitle1.png",
    "acplogo2": "asset/image/cctitle2.png",
    "headerlogo": "asset/image/aimc.png",
    "greybackground": "0xFFf5f5f5",
    "black": "0xFF1B1B1B",
    "blackgrayshadow": "0xFF565a5d",
    "blacksshadow1": "0xFF575A5D",
    "yellow": "0xFFffc82f",
    "greenishgray": "0xFFd6e8e8",
    "navigaionbarshadow": "0xFF575b5e",
    "leftarrow": "asset/image/icons/leftarrow.png",
    "downarrow": "asset/image/icons/downarrow.png",
    "transparent": "0x00000000",
    "acpicon": "asset/image/acpicon.png",
    "darkmodeblack": "0xFF1B1B1B",
    "darkmodegrey": "0xFF313131",
    "smallfontdark": "asset/image/icons/smallfontdark.png",
    "mediumfontdark": "asset/image/icons/mediumfontdark.png",
    "largefontdark": "asset/image/icons/largefontdark.png",
    "smallfont": "asset/image/icons/smallfont.png",
    "mediumfont": "asset/image/icons/mediumfont.png",
    "largefont": "asset/image/icons/largefont.png",
    "dividercolor": "0xFFE7E8E9",
    "typebgcolor": "0x33E7E8E9",
    "typedarkbgcolor": "0xFFE7E8E9",
    "hintcolorlight": "0xFF333333",
    "activethemecolordark": "0xFF545454",
    "inactivethemecolordark": "0xFF404040",
    "smallselected": "asset/image/icons/smallselected.png",
    "mediumselected": "asset/image/icons/mediumselected.png",
    "largeselected": "asset/image/icons/largeselected.png",
    "smalldarkselected": "asset/image/icons/smalldarkselected.png",
    "mediumdarkselected": "asset/image/icons/mediumdarkselected.png",
    "largedarkselected": "asset/image/icons/largedarkselected.png",
    "whiteGuidelineText": "asset/image/icons/cctitleWhite.png",
    "sliderinactivelightcolor": "0xFFCECFD1",
    "thumbColorSliderDarkGuideline": "0xFF545454",
    "fontsize1": "12",
    "fontsize2": "14",
    "fontsize3": "16",
    "fontsize4": "18",
    "fontsize5": "20",
    "ipadfontsize": "4"
  },
};

class CustomThemes {
  static final CustomThemes _obj = CustomThemes.fromJson(themes);
  factory CustomThemes() => _obj;

  CustomColors annals;
  CustomColors aimcc;
  CustomColors acpcg;

  /* Project Theme change ( Over all Theme set For that)*/
  String projectname;
  /*this is for what project you want to use theme*/

  CustomThemes._(
      {required this.annals,
      required this.aimcc,
      required this.acpcg,
      required this.projectname});

  factory CustomThemes.fromJson(Map<String, dynamic> json) => CustomThemes._(
      annals: CustomColors.fromJson(json['annals']),
      aimcc: CustomColors.fromJson(json["aimcc"]),
      acpcg: CustomColors.fromJson(json["acpcg"]),
      projectname: switch (F.appFlavor) {
        Flavor.annals => Flavor.annals.name,
        Flavor.aimcc => Flavor.aimcc.name,
        Flavor.guidelines => Flavor.guidelines.name,
        null => ''
      });

  CustomColors gettheme() {
    switch (F.appFlavor) {
      case Flavor.aimcc:
        return aimcc;
      case Flavor.annals:
        return annals;
      case Flavor.guidelines:
        return acpcg;
      default:
        return acpcg;
    }
  }
}

class CustomColors {
  Color bgColor;
  Color whitecolor;
  String font1;
  String font2;
  String logo;
  Color greybackground;
  Color black;
  Color blackgrayshadow;
  Color blacksshadow1;
  Color yellow;
  Color dividercolor;
  String collections;
  String settings;
  String home;
  String multimedia;
  String issue;
  String headerlogo;
  Color navigaionBarShadow;
  Color greenishgray;
  String acpLogo2;
  Color transparent;
  String smallfont;
  String mediumfont;
  String largefont;
  String leftarrow;
  String downarrow;
  String acpicon;
  Color darkmodegrey;
  Color darkmodeblack;
  String article;
  String aimccbookmark;
  String archives;
  String archiveheader;
  String archivesicon;
  String smallfontdark;
  String mediumfontdark;
  String largefontdark;
  String inprogress;
  Color typebgcolor;
  Color typedarkbgcolor;
  Color hintcolorlight;
  Color activethemecolordark;
  Color inactivethemecolordark;
  Color sliderinactivelightcolor;
  String smallselected;
  String mediumselected;
  String largeselected;
  String smalldarkselected;
  String mediumdarkselected;
  String largedarkselected;
  String whiteGuidelineText;
  Color thumbColorSliderDarkGuideline;
  double fontsize1;
  double fontsize2;
  double fontsize3;
  double fontsize4;
  double fontsize5;
  double ipadfontsize;

  CustomColors(
      {required this.thumbColorSliderDarkGuideline,
      required this.whiteGuidelineText,
      required this.bgColor,
      required this.dividercolor,
      required this.darkmodeblack,
      required this.darkmodegrey,
      required this.whitecolor,
      required this.font1,
      required this.font2,
      required this.logo,
      required this.greybackground,
      required this.black,
      required this.blackgrayshadow,
      required this.blacksshadow1,
      required this.yellow,
      required this.collections,
      required this.settings,
      required this.home,
      required this.multimedia,
      required this.issue,
      required this.headerlogo,
      required this.navigaionBarShadow,
      required this.greenishgray,
      required this.acpLogo2,
      required this.transparent,
      required this.largefont,
      required this.mediumfont,
      required this.smallfont,
      required this.leftarrow,
      required this.downarrow,
      required this.acpicon,
      required this.article,
      required this.aimccbookmark,
      required this.archives,
      required this.archiveheader,
      required this.archivesicon,
      required this.smallfontdark,
      required this.mediumfontdark,
      required this.largefontdark,
      required this.inprogress,
      required this.typebgcolor,
      required this.typedarkbgcolor,
      required this.hintcolorlight,
      required this.activethemecolordark,
      required this.inactivethemecolordark,
      required this.sliderinactivelightcolor,
      required this.smallselected,
      required this.mediumselected,
      required this.largeselected,
      required this.smalldarkselected,
      required this.mediumdarkselected,
      required this.largedarkselected,
      required this.fontsize1,
      required this.fontsize2,
      required this.fontsize3,
      required this.fontsize4,
      required this.fontsize5,
      required this.ipadfontsize});
  factory CustomColors.fromJson(Map<String, String> colorJson) => CustomColors(
      thumbColorSliderDarkGuideline:
          Color(int.parse(colorJson['thumbColorSliderDarkGuideline'] ?? '')),
      whiteGuidelineText: colorJson['whiteGuidelineText'] ?? '',
      dividercolor: Color(int.parse(colorJson['dividercolor']!)),
      darkmodegrey: Color(int.parse(colorJson['darkmodegrey']!)),
      darkmodeblack: Color(int.parse(colorJson['darkmodeblack']!)),
      bgColor: Color(int.parse(colorJson['bgcolor']!)),
      whitecolor: Color(int.parse(colorJson['whitecolor']!)),
      font1: colorJson['font1'] ?? '',
      font2: colorJson['font2'] ?? '',
      logo: colorJson['logo'] ?? '',
      greybackground: Color(int.parse(colorJson['greybackground']!)),
      black: Color(int.parse(colorJson['black']!)),
      transparent: Color(int.parse(colorJson['transparent']!)),
      blackgrayshadow: Color(int.parse(colorJson['blackgrayshadow']!)),
      blacksshadow1: Color(int.parse(colorJson['blacksshadow1']!)),
      yellow: Color(int.parse(colorJson['yellow']!)),
      collections: colorJson['collections'] ?? '',
      settings: colorJson['settings'] ?? '',
      home: colorJson['home'] ?? '',
      multimedia: colorJson['multimedia'] ?? '',
      issue: colorJson['issue'] ?? '',
      headerlogo: colorJson['headerlogo'] ?? '',
      navigaionBarShadow: Color(int.parse(colorJson['navigaionbarshadow']!)),
      greenishgray: Color(int.parse(colorJson['greenishgray']!)),
      acpLogo2: colorJson['acplogo2'] ?? '',
      smallfont: colorJson['smallfont'] ?? '',
      mediumfont: colorJson['mediumfont'] ?? '',
      largefont: colorJson['largefont'] ?? '',
      leftarrow: colorJson['leftarrow'] ?? '',
      downarrow: colorJson['downarrow'] ?? '',
      acpicon: colorJson['acpicon'] ?? '',
      article: colorJson['article'] ?? '',
      aimccbookmark: colorJson['aimccbookmark'] ?? '',
      archives: colorJson['archives'] ?? '',
      archiveheader: colorJson['archiveheader'] ?? '',
      archivesicon: colorJson['archivesicon'] ?? '',
      smallfontdark: colorJson['smallfontdark'] ?? '',
      mediumfontdark: colorJson['mediumfontdark'] ?? '',
      largefontdark: colorJson['largefontdark'] ?? '',
      inprogress: colorJson['inprogress'] ?? '',
      typebgcolor: Color(int.parse(colorJson['typebgcolor']!)),
      typedarkbgcolor: Color(int.parse(colorJson['typedarkbgcolor']!)),
      hintcolorlight: Color(int.parse(colorJson['hintcolorlight']!)),
      inactivethemecolordark:
          Color(int.parse(colorJson['inactivethemecolordark']!)),
      activethemecolordark:
          Color(int.parse(colorJson['activethemecolordark']!)),
      sliderinactivelightcolor:
          Color(int.parse(colorJson['sliderinactivelightcolor']!)),
      smallselected: colorJson['smallselected'] ?? '',
      mediumselected: colorJson['mediumselected'] ?? '',
      largeselected: colorJson['largeselected'] ?? '',
      smalldarkselected: colorJson['smalldarkselected'] ?? '',
      mediumdarkselected: colorJson['mediumdarkselected'] ?? '',
      largedarkselected: colorJson['largedarkselected'] ?? '',
      fontsize1: double.parse(colorJson['fontsize1'] ?? '12.0'),
      fontsize2: double.parse(colorJson['fontsize2'] ?? '14.0'),
      fontsize3: double.parse(colorJson['fontsize3'] ?? '16.0'),
      fontsize4: double.parse(colorJson['fontsize4'] ?? '18.0'),
      fontsize5: double.parse(colorJson['fontsize5'] ?? '20.0'),
      ipadfontsize: double.parse(colorJson['ipadfontsize'] ?? '4.0'));
}
