import 'package:dragonball/provider/dragonball_provider.dart';
import 'package:dragonball/provider/search_bar_provider.dart';
import 'package:dragonball/screens/power_comparison_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dragonball/screens/character_detail_screen.dart.dart';
import 'package:dragonball/widget/character_card.dart';

class DragonBallScreen extends ConsumerStatefulWidget {
  const DragonBallScreen({super.key});

  @override
  ConsumerState<DragonBallScreen> createState() => _DragonBallScreenState();
}

class _DragonBallScreenState extends ConsumerState<DragonBallScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();

    // Fetch initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dragonBallNotifierProvider.notifier).fetchMoreCharacters();
    });

    // Scroll listener for pagination
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Load more data if not searching
        if (searchQuery.isEmpty) {
          ref.read(dragonBallNotifierProvider.notifier).fetchMoreCharacters();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToCharacterDetail(BuildContext context, dynamic character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailScreen(character: character),
      ),
    );
  }

  void _searchCharacters(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSearchVisible = ref.watch(searchBarProvider);
    final searchBarNotifier = ref.read(searchBarProvider.notifier);
    final state = ref.watch(dragonBallNotifierProvider);

    // Determine what list to show (searched results or full list)
    final List<dynamic> displayList =
        searchQuery.isNotEmpty
            ? state.characters
                .where(
                  (character) => character.name!.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
                )
                .toList()
            : state.characters;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          PowerComparisonScreen(characters: state.characters),
                ),
              );
            },
            icon: Icon(Icons.bolt),
          ),
        ],
        bottom:
            isSearchVisible
                ? PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search characters...",
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.grey[900],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white54,
                        ),
                        suffixIcon:
                            _searchController.text.isNotEmpty
                                ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.white54,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    _searchCharacters(""); // Reset search
                                  },
                                )
                                : null,
                      ),
                      onChanged: _searchCharacters,
                    ),
                  ),
                )
                : null,
        centerTitle: true,
        leading: IconButton(
          onPressed: searchBarNotifier.toogleSearchBar,
          icon: Icon(isSearchVisible ? Icons.close : Icons.search),
        ),
        title: const Text(
          "Dragon Ball",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      body:
          state.isLoading && state.characters.isEmpty
              ? const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              )
              : displayList.isEmpty && searchQuery.isNotEmpty
              ? const Center(
                child: Text(
                  "No Results Found",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
              : GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                padding: const EdgeInsets.all(8),
                itemCount:
                    searchQuery.isEmpty && state.hasMore
                        ? displayList.length + 1
                        : displayList.length,
                itemBuilder: (context, index) {
                  if (index < displayList.length) {
                    final character = displayList[index];
                    return GestureDetector(
                      onTap:
                          () => _navigateToCharacterDetail(context, character),
                      child: CharacterCard(character: character),
                    );
                  }
                  if (searchQuery.isEmpty && state.hasMore) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
    );
  }
}
