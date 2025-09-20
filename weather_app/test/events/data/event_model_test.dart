import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/events/data/models/event_model.dart';

void main() {
  group('EventModel', () {
    test('fromJson should parse correctly', () {
      final json = {
        "id": "1",
        "type": "Tornado",
        "description": "Evento de prueba",
        "date": "2025-09-20T12:00:00Z",
        "location": "Barranquilla",
        "latitude": 12.34,
        "longitude": 56.78,
      };

      final event = EventModel.fromJson(json);

      expect(event.id, "1");
      expect(event.type, "Tornado");
      expect(event.description, "Evento de prueba");
      expect(event.date, DateTime.parse("2025-09-20T12:00:00Z"));
      expect(event.location, "Barranquilla");
      expect(event.latitude, 12.34);
      expect(event.longitude, 56.78);
    });

    test('toJson should return correct map', () {
      final event = EventModel(
        id: "2",
        type: "Granizo",
        description: "Evento con granizo",
        date: DateTime.parse("2025-09-20T12:00:00Z"),
        location: "Medellín",
        latitude: 1.1,
        longitude: 2.2,
      );

      final map = event.toJson();

      expect(map['id'], "2");
      expect(map['type'], "Granizo");
      expect(map['description'], "Evento con granizo");
      expect(map['date'], "2025-09-20T12:00:00.000Z"); 
      expect(map['location'], "Medellín");
      expect(map['latitude'], 1.1);
      expect(map['longitude'], 2.2);
    });
  });
}
