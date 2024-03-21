import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuidelineWebviewScaleNotifier extends AutoDisposeNotifier<double> {
  @override
  double build() => 1;

  void increaseScale() {
    if (state >= 1 && state <= 6.0) {
      state = state * 1.2;
    }
  }

  void decreaseScale() {
    if (state != 1) {
      state = state / 1.2;
    }
  }
}

final guidelineWebviewScaleProvider =
    AutoDisposeNotifierProvider<GuidelineWebviewScaleNotifier, double>(
        () => GuidelineWebviewScaleNotifier());

class GuidelineSilderValueNotifier extends AutoDisposeNotifier<double> {
  int index = 0;
  @override
  double build() => 0;

  void changeValue(double value) {
    state = value;
    index = value.floor();
  }
}

final guidelineSliderValueProvider =
    AutoDisposeNotifierProvider<GuidelineSilderValueNotifier, double>(
        () => GuidelineSilderValueNotifier());
