import 'package:dragonball/model/dragonball_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dragonball/provider/power_comparison_provider.dart';

class PowerComparisonScreen extends ConsumerWidget {
  final List<DragonBallCharacterModel> characters;

  const PowerComparisonScreen({super.key, required this.characters});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCharacters = ref.watch(powerComparisonProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Power Comparison",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDropdowns(ref),
            if (selectedCharacters[1] != null && selectedCharacters[2] != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: _buildComparison(selectedCharacters),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdowns(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildCharacterDropdown(1, ref),
          const SizedBox(height: 10),
          _buildCharacterDropdown(2, ref),
        ],
      ),
    );
  }

  Widget _buildCharacterDropdown(int index, WidgetRef ref) {
    final selectedCharacters = ref.watch(powerComparisonProvider);
    final selectedCharacter = selectedCharacters[index];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DragonBallCharacterModel>(
          value: selectedCharacter,
          hint: Text(
            "Select Character $index",
            style: const TextStyle(color: Colors.white),
          ),
          dropdownColor: Colors.grey[900],
          style: const TextStyle(color: Colors.orange),
          items:
              characters.map((character) {
                return DropdownMenuItem(
                  value: character,
                  child: Text(
                    character.name ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
          onChanged: (DragonBallCharacterModel? newValue) {
            ref
                .read(powerComparisonProvider.notifier)
                .selectCharacter(index, newValue);
          },
        ),
      ),
    );
  }

  // Function to safely parse ki values
  double _parseKi(String ki) {
    String cleanedKi = ki.replaceAll(RegExp(r'[^0-9.]'), '');

    int decimalCount = cleanedKi.split('.').length - 1;
    if (decimalCount > 1) {
      cleanedKi = cleanedKi.replaceAll(RegExp(r'\.(?=.*\.)'), '');
    }

    // Parse the cleaned string into a double
    return double.tryParse(cleanedKi) ?? 0.0;
  }

  Widget _buildComparison(
    Map<int, DragonBallCharacterModel?> selectedCharacters,
  ) {
    final character1 = selectedCharacters[1]!;
    final character2 = selectedCharacters[2]!;

    final power1 = _parseKi(character1.ki ?? '0');
    final power2 = _parseKi(character2.ki ?? '0');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCharacterCard(character1, power1 > power2),
        const SizedBox(width: 20),
        _buildCharacterCard(character2, power2 > power1),
      ],
    );
  }

  Widget _buildCharacterCard(
    DragonBallCharacterModel character,
    bool isWinner,
  ) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (isWinner)
              const Padding(
                padding: EdgeInsets.only(top: 1),
                child: Icon(Icons.emoji_events, color: Colors.yellow, size: 30),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(1),

              child: Image.network(
                character.image ?? '',
                width: 150,
                height: 350,
                fit: BoxFit.contain,
              ),
            ),
            isWinner ? SizedBox(height: 12) : const SizedBox(height: 26),
            Text(
              character.name ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Power: ${character.ki}",
              style: const TextStyle(color: Colors.orange, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
