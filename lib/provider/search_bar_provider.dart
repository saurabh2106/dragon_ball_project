import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarNotifier extends StateNotifier<bool> {
  SearchBarNotifier() : super(false);

  void toogleSearchBar() => state = !state;

  void hideSearchBar() => state = false;
}

final searchBarProvider = StateNotifierProvider<SearchBarNotifier, bool>(
  (ref) => SearchBarNotifier(),
);
