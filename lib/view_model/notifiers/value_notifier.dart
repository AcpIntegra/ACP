import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValueNotifier extends Notifier<bool> {
  late bool staticValue;
  @override
  bool build() {
    staticValue = false;
    return staticValue;
  }

  void changeDynamic(bool value) => state = value;
  void changeStatic(bool value) {
    staticValue = (value) ? true : false;
    // state = staticValue;
  }
}

final valueProvider =
    NotifierProvider<ValueNotifier, bool>(() => ValueNotifier());
