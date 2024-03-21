import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() => 0;
  void changeLoadingPercent(int index) => state = index;
}

final loadingProvider =
    AutoDisposeNotifierProvider<LoadingNotifier, int>(() => LoadingNotifier());
