import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final dynamic character;
  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 35, 35),
      appBar: AppBar(
        title: Text(
          character.name ?? "Character Details",
          style: const TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.6,
              child: CachedNetworkImage(
                imageUrl: character.image ?? "",
                fit: BoxFit.contain,
                errorWidget:
                    (context, url, error) =>
                        const Icon(Icons.error, color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Race: ${character.race ?? "Unknown"}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Gender: ${character.gender ?? "Unknown"}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Base KI: ${character.ki ?? "N/A"}",
                    style: const TextStyle(color: Colors.yellow, fontSize: 18),
                  ),
                  Text(
                    "Total KI: ${character.maxKi ?? "N/A"}",
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Affiliation: ${character.affiliation ?? "N/A"}",
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                    ),
                  ),
                  Visibility(
                    visible: character.originPlanet?.name != null,
                    child: Text(
                      "Origin Planet Name: ${character.originPlanet?.name ?? "N/A"}",
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                  Visibility(
                    visible: character.transformations?[0].name != null,
                    child: Text(
                      "Transformations Name: ${character.transformations?[0].name ?? "Unknown" ?? "N/A"}",
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
