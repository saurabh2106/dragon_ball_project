import 'package:dragonball/model/dragonball_model.dart';
import 'package:dragonball/repose/dragonball_repos.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DragonBallState {
  final List<DragonBallCharacterModel> characters;
  final bool isLoading;
  final int currentPage;
  final bool hasMore;

  DragonBallState({
    required this.characters,
    required this.isLoading,
    required this.currentPage,
    required this.hasMore,
  });

  DragonBallState copyWith({
    List<DragonBallCharacterModel>? characters,
    bool? isLoading,
    int? currentPage,
    bool? hasMore,
  }) {
    return DragonBallState(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class DragonBallNotifier extends StateNotifier<DragonBallState> {
  final DragonBallRepo repo;
  bool isFetching = false;

  DragonBallNotifier(this.repo)
    : super(
        DragonBallState(
          characters: [],
          isLoading: false,
          currentPage: 1,
          hasMore: true,
        ),
      );

  Future<void> fetchMoreCharacters() async {
    if (isFetching || !state.hasMore) {
      debugPrint(
        "Skipping API call: isLoading=${state.isLoading}, hasMore=${state.hasMore}",
      );
      return;
    }

    debugPrint("🚀 Fetching page: ${state.currentPage}");
    isFetching = true;
    state = state.copyWith(isLoading: true);

    try {
      final newCharacters = await repo.fetchCharacters(state.currentPage);

      debugPrint("✅ Received ${newCharacters.length} characters.");

      final bool hasMore = newCharacters.isNotEmpty;

      state = state.copyWith(
        characters: [...state.characters, ...newCharacters],
        isLoading: false,
        currentPage: state.currentPage + 1,
        hasMore: hasMore,
      );
    } catch (e) {
      debugPrint("❌ API ERROR: $e");
      state = state.copyWith(isLoading: false);
    } finally {
      isFetching = false;
    }
  }
}

final dragonBallNotifierProvider =
    StateNotifierProvider<DragonBallNotifier, DragonBallState>(
      (ref) => DragonBallNotifier(ref.read(dragonBallRepoProvider)),
    );
