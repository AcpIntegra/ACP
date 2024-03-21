import 'package:acp_app/main/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeNotifier extends AutoDisposeNotifier<bool>
    with WidgetsBindingObserver {
  static const String key = 'isDark';
  late SharedPreferences prefs;
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    isDark();
  }

  @override
  bool build() {
    prefs = Config().prefs;
    WidgetsBinding.instance.addObserver(this);
    bool? fromStorage = prefs.getBool(key);
    return (fromStorage == null) ? _isDark() : fromStorage;
  }

  bool _isDark() {
    bool value =
        (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.light)
            ? false
            : true;
    prefs.setBool(key, value);
    return value;
  }

  void isDark() {
    state = _isDark();
  }

  void setDark() async {
    state = true;
    await prefs.setBool(key, true);
  }

  void setLight() async {
    state = false;
    await prefs.setBool(key, false);
  }
}
