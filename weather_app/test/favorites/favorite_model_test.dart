import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/favorites/data/favorite_model.dart';

void main() {
  test('FavoriteModel should store values correctly', () {
    final favorite = FavoriteModel(
      id: "123",
      type: "Tormenta",
      description: "Evento favorito",
    );

    expect(favorite.id, "123");
    expect(favorite.type, "Tormenta");
    expect(favorite.description, "Evento favorito");
  });
}
