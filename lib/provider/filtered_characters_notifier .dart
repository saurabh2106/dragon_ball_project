import 'package:dragonball/model/dragonball_model.dart';
// import 'package:dragonball/provider/dragonball_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilteredCharactersNotifier
    extends StateNotifier<List<DragonBallCharacterModel>> {
  FilteredCharactersNotifier() : super([]); // Default empty list

  void searchCharacters(
    String query,
    List<DragonBallCharacterModel> allCharacters,
  ) {
    state =
        query.isEmpty
            ? allCharacters
            : allCharacters
                .where(
                  (character) => character.name!.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                )
                .toList();
  }

  void clear() {
    state = [];
  }
}

final filteredCharactersProvider = StateNotifierProvider<
  FilteredCharactersNotifier,
  List<DragonBallCharacterModel>
>((ref) {
  // final characters = ref.watch(dragonBallNotifierProvider).characters;
  return FilteredCharactersNotifier();
});
