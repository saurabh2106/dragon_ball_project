// import 'package:hive/hive.dart';
// import 'package:pokedex/model/pokemon_model.dart';

// class HiveRepo {
//   final pokedoxName = 'pokedox';
//   void registerAdaptor() {
//     Hive.registerAdapter(PokemonModelAdapter());
//   }

//   void addPokemonToHive(PokemonModel pokemon) async {
//     final pokedox = await Hive.openBox<PokemonModel>(pokedoxName);
//     Hive.openBox(pokedoxName);

//     await pokedox.put(pokemon.id, pokemon);
//   }

//   Future<List<PokemonModel>> getAllFavPokeFromHive() async {
//     final pokeBox = await Hive.openBox<PokemonModel>(pokedoxName);
//     if (pokeBox.isOpen) {
//       return pokeBox.values.toList();
//     } else {
//       return [];
//     }
//   }

//   Future deletePokeFromHive(String id) async {
//     final pokedox = await Hive.openBox<PokemonModel>(pokedoxName);

//     await pokedox.delete(id);
//   }

//   Future<bool> isPokemonInFavorites(String id) async {
//     final pokedox = await Hive.openBox<PokemonModel>(pokedoxName);

//     return pokedox.containsKey(id);
//   }
// }
