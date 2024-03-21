import 'package:acp_app/view_model/notifiers/darkmode_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeNotifierProvider<DarkModeNotifier, bool> darkModeProvider =
    AutoDisposeNotifierProvider<DarkModeNotifier, bool>(
        () => DarkModeNotifier());
