import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() => 0;

  void changeIndex(int selectedIndex) => state = selectedIndex;
}

final AutoDisposeNotifierProvider<IndexNotifier, int> indexProvider =
    AutoDisposeNotifierProvider<IndexNotifier, int>(() => IndexNotifier());
