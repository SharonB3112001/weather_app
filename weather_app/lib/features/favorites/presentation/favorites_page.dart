import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorite_provider.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text("No tienes eventos favoritos"),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (_, i) {
                final fav = favorites[i];
                return ListTile(
                  title: Text(fav.type),
                  subtitle: Text(fav.description),
                );
              },
            ),
    );
  }
}
