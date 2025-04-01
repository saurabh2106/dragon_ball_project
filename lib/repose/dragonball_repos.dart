import 'package:dragonball/model/dragonball_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dragonball/network/dio_client.dart';

class DragonBallRepo {
  final Ref ref;
  DragonBallRepo(this.ref);

  Future<List<DragonBallCharacterModel>> fetchCharacters(int page) async {
    try {
      final response = await ref
          .read(dioProvider)
          .get("/characters", params: {"page": page});

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['items']; // Fix applied

        return data.map((e) => DragonBallCharacterModel.fromJson(e)).toList();
      } else {
        throw Exception("⚠️ Failed to load characters");
      }
    } catch (e) {
      rethrow;
    }
  }
}

final dragonBallRepoProvider = Provider<DragonBallRepo>(
  (ref) => DragonBallRepo(ref),
);
