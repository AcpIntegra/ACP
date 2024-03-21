import 'package:acp_app/view/view_utils/dynamic_theme.dart';
import 'package:flutter/material.dart';

class AnnalsTheme {
  static final Map<String, dynamic> lightTheme = {
    "background": 0xfffafdfc,
    "brightness": Brightness.light,
    "error": 0xffba1a1a,
    "errorContainer": 0xffffdad6,
    "inversePrimary": 0xff4cd9de,
    "inverseSurface": 0xff2d3131,
    "onBackground": 0xff191c1c,
    "onError": 0xffffffff,
    "onErrorContainer": 0xff410002,
    "onInverseSurface": 0xffeff1f1,
    "onPrimary": 0xffffffff,
    "onPrimaryContainer": 0xff002021,
    "onSecondary": 0xffffffff,
    "onSecondaryContainer": 0xff041f20,
    "onSurface": 0xff191c1c,
    "onSurfaceVariant": 0xff3f4949,
    "onTertiary": 0xffffffff,
    "onTertiaryContainer": 0xff061c36,
    "outline": 0xff6f7979,
    "outlineVariant": 0xffbec8c8,
    "primary": 0xff00696c,
    "primaryContainer": 0xff8ff3f6,
    "scrim": 0xff000000,
    "secondary": 0xff4a6364,
    "secondaryContainer": 0xffcce8e8,
    "shadow": 0xff000000,
    "surface": 0xfffafdfc,
    "surfaceTint": 0xff00696c,
    "surfaceVariant": 0xffdae4e4,
    "tertiary": 0xff4d5f7c,
    "tertiaryContainer": 0xffd5e3ff
  };

  static final Map<String, dynamic> darkTheme = {
    "background": 0xff191c1c,
    "brightness": Brightness.dark,
    "error": 0xffffb4ab,
    "errorContainer": 0xff93000a,
    "inversePrimary": 0xff00696c,
    "inverseSurface": 0xffe0e3e2,
    "onBackground": 0xffe0e3e2,
    "onError": 0xff690005,
    "onErrorContainer": 0xffffb4ab,
    "onInverseSurface": 0xff2d3131,
    "onPrimary": 0xff003738,
    "onPrimaryContainer": 0xff8ff3f6,
    "onSecondary": 0xff1b3435,
    "onSecondaryContainer": 0xffcce8e8,
    "onSurface": 0xffe0e3e2,
    "onSurfaceVariant": 0xffbec8c8,
    "onTertiary": 0xff1e314c,
    "onTertiaryContainer": 0xffd5e3ff,
    "outline": 0xff899393,
    "outlineVariant": 0xff3f4949,
    "primary": 0xff4cd9de,
    "primaryContainer": 0xff004f51,
    "scrim": 0xff000000,
    "secondary": 0xffb0cccc,
    "secondaryContainer": 0xff324b4c,
    "shadow": 0xff000000,
    "surface": 0xff191c1c,
    "surfaceTint": 0xff4cd9de,
    "surfaceVariant": 0xff3f4949,
    "tertiary": 0xffb4c7e9,
    "tertiaryContainer": 0xff354763
  };

  AppTheme dark;
  AppTheme light;
  AnnalsTheme._(this.dark, this.light);
  factory AnnalsTheme() => AnnalsTheme._(
      AppTheme.fromJson(AnnalsTheme.lightTheme),
      AppTheme.fromJson(AnnalsTheme.darkTheme));
}

class AimccTheme {
  static final Map<String, dynamic> lightTheme = {
    "background": 0xfffffbff,
    "brightness": Brightness.light,
    "error": 0xffba1a1a,
    "errorContainer": 0xffffdad6,
    "inversePrimary": 0xffdab9ff,
    "inverseSurface": 0xff322f33,
    "onBackground": 0xff1d1b1e,
    "onError": 0xffffffff,
    "onErrorContainer": 0xff410002,
    "onInverseSurface": 0xfff5eff4,
    "onPrimary": 0xffffffff,
    "onPrimaryContainer": 0xff2a0053,
    "onSecondary": 0xffffffff,
    "onSecondaryContainer": 0xff20182a,
    "onSurface": 0xff1d1b1e,
    "onSurfaceVariant": 0xff4a454e,
    "onTertiary": 0xffffffff,
    "onTertiaryContainer": 0xff321018,
    "outline": 0xff7b757f,
    "outlineVariant": 0xffccc4cf,
    "primary": 0xff7841b9,
    "primaryContainer": 0xffeedbff,
    "scrim": 0xff000000,
    "secondary": 0xff655a6f,
    "secondaryContainer": 0xffecddf7,
    "shadow": 0xff000000,
    "surface": 0xfffffbff,
    "surfaceTint": 0xff7841b9,
    "surfaceVariant": 0xffe8e0eb,
    "tertiary": 0xff805159,
    "tertiaryContainer": 0xffffd9de
  };

  static Map<String, dynamic> darkTheme = {
    "background": 0xff1d1b1e,
    "brightness": Brightness.dark,
    "error": 0xffffb4ab,
    "errorContainer": 0xff93000a,
    "inversePrimary": 0xff7841b9,
    "inverseSurface": 0xffe7e1e5,
    "onBackground": 0xffe7e1e5,
    "onError": 0xff690005,
    "onErrorContainer": 0xffffb4ab,
    "onInverseSurface": 0xff322f33,
    "onPrimary": 0xff460084,
    "onPrimaryContainer": 0xffeedbff,
    "onSecondary": 0xff362d40,
    "onSecondaryContainer": 0xffecddf7,
    "onSurface": 0xffe7e1e5,
    "onSurfaceVariant": 0xffccc4cf,
    "onTertiary": 0xff4b252c,
    "onTertiaryContainer": 0xffffd9de,
    "outline": 0xff958e98,
    "outlineVariant": 0xff4a454e,
    "primary": 0xffdab9ff,
    "primaryContainer": 0xff5f259f,
    "scrim": 0xff000000,
    "secondary": 0xffcfc1da,
    "secondaryContainer": 0xff4d4357,
    "shadow": 0xff000000,
    "surface": 0xff1d1b1e,
    "surfaceTint": 0xffdab9ff,
    "surfaceVariant": 0xff4a454e,
    "tertiary": 0xfff2b7c0,
    "tertiaryContainer": 0xff653b42
  };
  AppTheme dark;
  AppTheme light;
  AimccTheme._(this.dark, this.light);
  factory AimccTheme() => AimccTheme._(AppTheme.fromJson(AimccTheme.lightTheme),
      AppTheme.fromJson(AimccTheme.darkTheme));
}

class AcpcgTheme {
  static final Map<String, dynamic> lightTheme = {
    "background": 0xfffafdfc,
    "brightness": Brightness.light,
    "error": 0xffba1a1a,
    "errorContainer": 0xffffdad6,
    "inversePrimary": 0xff4cd9de,
    "inverseSurface": 0xff2d3131,
    "onBackground": 0xff191c1c,
    "onError": 0xffffffff,
    "onErrorContainer": 0xff410002,
    "onInverseSurface": 0xffeff1f1,
    "onPrimary": 0xffffffff,
    "onPrimaryContainer": 0xff002021,
    "onSecondary": 0xffffffff,
    "onSecondaryContainer": 0xff041f20,
    "onSurface": 0xff191c1c,
    "onSurfaceVariant": 0xff3f4949,
    "onTertiary": 0xffffffff,
    "onTertiaryContainer": 0xff061c36,
    "outline": 0xff6f7979,
    "outlineVariant": 0xffbec8c8,
    "primary": 0xff00696c,
    "primaryContainer": 0xff8ff3f6,
    "scrim": 0xff000000,
    "secondary": 0xff4a6364,
    "secondaryContainer": 0xffcce8e8,
    "shadow": 0xff000000,
    "surface": 0xfffafdfc,
    "surfaceTint": 0xff00696c,
    "surfaceVariant": 0xffdae4e4,
    "tertiary": 0xff4d5f7c,
    "tertiaryContainer": 0xffd5e3ff
  };

  static final Map<String, dynamic> darkTheme = {
    "background": 0xff191c1c,
    "brightness": Brightness.dark,
    "error": 0xffffb4ab,
    "errorContainer": 0xff93000a,
    "inversePrimary": 0xff00696c,
    "inverseSurface": 0xffe0e3e2,
    "onBackground": 0xffe0e3e2,
    "onError": 0xff690005,
    "onErrorContainer": 0xffffb4ab,
    "onInverseSurface": 0xff2d3131,
    "onPrimary": 0xff003738,
    "onPrimaryContainer": 0xff8ff3f6,
    "onSecondary": 0xff1b3435,
    "onSecondaryContainer": 0xffcce8e8,
    "onSurface": 0xffe0e3e2,
    "onSurfaceVariant": 0xffbec8c8,
    "onTertiary": 0xff1e314c,
    "onTertiaryContainer": 0xffd5e3ff,
    "outline": 0xff899393,
    "outlineVariant": 0xff3f4949,
    "primary": 0xff4cd9de,
    "primaryContainer": 0xff004f51,
    "scrim": 0xff000000,
    "secondary": 0xffb0cccc,
    "secondaryContainer": 0xff324b4c,
    "shadow": 0xff000000,
    "surface": 0xff191c1c,
    "surfaceTint": 0xff4cd9de,
    "surfaceVariant": 0xff3f4949,
    "tertiary": 0xffb4c7e9,
    "tertiaryContainer": 0xff354763
  };

  AppTheme dark;
  AppTheme light;
  AcpcgTheme._(this.dark, this.light);
  factory AcpcgTheme() => AcpcgTheme._(AppTheme.fromJson(AcpcgTheme.lightTheme),
      AppTheme.fromJson(AcpcgTheme.darkTheme));
}
