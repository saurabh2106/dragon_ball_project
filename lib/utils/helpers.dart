import 'package:flutter/material.dart';
import 'package:dragonball/utils/constant.dart';

class Helpers {
  static Color? getPokemonCardColor({required String typeOfdragonball}) {
    switch (typeOfdragonball) {
      case 'Normal':
        return lightBlue;
      case 'Fire':
        return darkRed;
      case 'Water':
        return lightBlue;
      case 'Electric':
        return Colors.amber;
      case 'Grass':
        return lightGreen;
      case 'Ice':
        return lightBlue;
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.deepPurple;
      case 'Ground':
        return Colors.brown;
      case 'Psychic':
        return darkYellow;
      case 'bug':
        return Colors.green;
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.deepPurpleAccent;
      default:
        return lightBlue;
    }
  }
}
