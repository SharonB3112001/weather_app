import '../../../../core/network/api_client.dart';
import '../models/event_model.dart';

class EventRemoteDataSource {
  final ApiClient client;

  EventRemoteDataSource(this.client);

  Future<List<EventModel>> fetchEvents(double lat, double lon) async {
    final endpoint =
        "/timeline/$lat,$lon?include=events&unitGroup=metric&lang=es";
    final data = await client.get(endpoint);

    final List<EventModel> events = [];

    final days = data['days'] as List<dynamic>? ?? [];
    for (final day in days) {
      final dayEvents = day['events'] as List<dynamic>? ?? [];
      for (final e in dayEvents) {
        events.add(EventModel.fromJson(e));
      }
    }

    return events;
  }
}
