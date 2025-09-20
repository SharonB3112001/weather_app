import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/favorite_model.dart';

class FavoriteNotifier extends StateNotifier<List<FavoriteModel>> {
  FavoriteNotifier() : super([]);

  void add(FavoriteModel model) {
    state = [...state, model];
  }

  void remove(String id) {
    state = state.where((f) => f.id != id).toList();
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, List<FavoriteModel>>(
  (ref) => FavoriteNotifier(),
);
