import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorite_provider.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Favoritos")),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (_, i) {
          final fav = favorites[i];
          return ListTile(
            title: Text(fav.type),
            subtitle: Text(fav.description),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => ref.read(favoriteProvider.notifier).remove(fav.id),
            ),
          );
        },
      ),
    );
  }
}
