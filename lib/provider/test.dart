import 'package:dragonball/model/dragonball_model.dart';
import 'package:dragonball/repose/dragonball_repos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DragonBallNotifier extends StateNotifier<DragonBallState> {
  final DragonBallRepo repo;
  int pageNo = 1;
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

  Future<void> fetchNextPage() async {
    if (isFetching || !state.hasMore) {
      return;
    }

    isFetching = true;
    state = state.copyWith(isLoading: true);

    try {
      final newCharacters = await repo.fetchCharacters(pageNo);
      state = state.copyWith(
        characters: [...state.characters, ...newCharacters],
        isLoading: false,
        currentPage: pageNo,
        hasMore: newCharacters.isNotEmpty, // Check if more data is available
      );

      pageNo++;
    } catch (e) {
      state = state.copyWith(isLoading: false);
    } finally {
      isFetching = false;
    }
  }
}

final dragonballProvider =
    StateNotifierProvider<DragonBallNotifier, DragonBallState>(
      (ref) => DragonBallNotifier(ref.read(dragonBallRepoProvider)),
    );

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
