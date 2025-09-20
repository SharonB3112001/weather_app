import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/favorites/data/favorite_model.dart';

void main() {
  test('FavoriteModel should store eventId correctly', () {
    final favorite = FavoriteModel(eventId: "123", name: "Evento favorito");

    expect(favorite.eventId, "123");
    expect(favorite.name, "Evento favorito");
  });
}
