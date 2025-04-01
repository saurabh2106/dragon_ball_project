# Dragon Ball App

## Overview
This Flutter application shows characters and their power levels in Dragon Ball Anime. Users can select two characters from a dropdown list, and the app visually displays their power comparison using a well-designed UI.

## Features
- **Character Selection**: Users can select two characters from a predefined list.
- **Power Comparison**: Displays a comparison of power levels between the selected characters.
- **Enhanced UI**: Uses `Card`, `DropdownButton`, and `Image.network` for a visually appealing interface.
- **State Management**: Implemented using `flutter_riverpod` for managing selected characters.

## Technologies Used
- **Flutter**: Cross-platform development framework.
- **Dart**: Programming language for Flutter.
- **Riverpod**: State management solution.
- **Material UI Components**: Used for dropdowns, cards, and images.

## Folder Structure
lib/
├── model/
│   ├── dragonball_model.dart
│   ├── dragonball_model.g.dart
├── network/
│   ├── dio_client.dart
├── provider/
│   ├── dragonball_provider.dart
│   ├── filtered_characters_notifier.dart
│   ├── power_comparison_provider.dart
│   ├── search_bar_provider.dart
├── repose/
│   ├── dragonball_repos.dart
├── screens/
│   ├── all_dragonball_list.dart
│   ├── character_detail_screen.dart
│   ├── power_comparison_screen.dart
├── widget/
│   ├── character_card.dart
├── main.dart


