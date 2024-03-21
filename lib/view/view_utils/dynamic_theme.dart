import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:acp_app/view/view_utils/themedata.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ColorScheme colorScheme;
  AppTheme(this.colorScheme);
  factory AppTheme.fromJson(Map<String, dynamic> json) => AppTheme(ColorScheme(
      brightness: json["brightness"],
      primary: Color(json["primary"]),
      onPrimary: Color(json["onPrimary"]),
      secondary: Color(json["secondary"]),
      onSecondary: Color(json["onSecondary"]),
      error: Color(json["error"]),
      onError: Color(json["onError"]),
      background: Color(json["background"]),
      onBackground: Color(json["onBackground"]),
      surface: Color(json["surface"]),
      onSurface: Color(json["onSurface"])));

  static ColorScheme getDarkScheme() {
    switch (F.appFlavor) {
      case Flavor.annals:
        return AnnalsTheme().dark.colorScheme;
      case Flavor.guidelines:
        return AcpcgTheme().dark.colorScheme;
      case Flavor.aimcc:
        return AimccTheme().dark.colorScheme;
      default:
        return ColorScheme.fromSeed(
            seedColor: Colors.deepPurpleAccent, brightness: Brightness.dark);
    }
  }

  static ColorScheme getLightScheme() {
    switch (F.appFlavor) {
      case Flavor.annals:
        return AnnalsTheme().light.colorScheme;
      case Flavor.guidelines:
        return AcpcgTheme().light.colorScheme;
      case Flavor.aimcc:
        return AimccTheme().light.colorScheme;
      default:
        return ColorScheme.fromSeed(
            seedColor: Colors.deepPurpleAccent, brightness: Brightness.light);
    }
  }
}
