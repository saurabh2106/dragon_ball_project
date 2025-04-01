import 'package:dragonball/model/dragonball_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dragonball/network/dio_client.dart';

class DragonBallRepo {
  final Ref ref;
  DragonBallRepo(this.ref);

  Future<List<DragonBallCharacterModel>> fetchCharacters(int page) async {
    print("📡 API CALL: Fetching page $page...");
    try {
      final response = await ref
          .read(dioProvider)
          .get("/characters", params: {"page": page});

      print("✅ Response status code: ${response.statusCode}");
      print("🔎 Full Response body: ${response.data}");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['items']; // Fix applied
        print("📦 Characters received: ${response.data['items']}");

        return data.map((e) => DragonBallCharacterModel.fromJson(e)).toList();
      } else {
        throw Exception("⚠️ Failed to load characters");
      }
    } catch (e) {
      print("❌ API ERROR: $e");
      rethrow;
    }
  }
}

final dragonBallRepoProvider = Provider<DragonBallRepo>(
  (ref) => DragonBallRepo(ref),
);
