import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import '../../events/data/models/realm_models.dart';

final realmProvider = Provider<Realm>((ref) {
  final config = Configuration.local([EventRealm.schema]);
  return Realm(config);
});

class FavoritesNotifier extends StateNotifier<List<EventRealm>> {
  final Realm _realm;

  FavoritesNotifier(this._realm) : super([]) {
    _loadFavorites();
  }

  void _loadFavorites() {
    final favorites = _realm.all<EventRealm>();
    state = favorites.toList();
  }

  void toggle(EventRealm event) {
    final results = _realm.all<EventRealm>().where((e) => e.id == event.id);
    final existing = results.isNotEmpty ? results.first : null;

    _realm.write(() {
      if (existing != null) {
        _realm.delete(existing);
      } else {
        _realm.add(event);
      }
    });

    _loadFavorites();
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<EventRealm>>((ref) {
  final realm = ref.read(realmProvider);
  return FavoritesNotifier(realm);
});
