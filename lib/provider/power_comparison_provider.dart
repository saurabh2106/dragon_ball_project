import 'package:dragonball/model/dragonball_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PowerComparisonNotifier
    extends StateNotifier<Map<int, DragonBallCharacterModel?>> {
  PowerComparisonNotifier() : super({1: null, 2: null});

  void selectCharacter(int index, DragonBallCharacterModel? character) {
    state = {...state, index: character};
  }
}

final powerComparisonProvider = StateNotifierProvider<
  PowerComparisonNotifier,
  Map<int, DragonBallCharacterModel?>
>((ref) => PowerComparisonNotifier());
